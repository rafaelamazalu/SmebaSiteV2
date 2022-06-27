from ast import Try
import time
import argparse
import json
from unittest import case
from spade.agent import Agent
from spade.behaviour import OneShotBehaviour, CyclicBehaviour
from spade.message import Message
from spade.template import Template

XMPP_DOMAIN = "test.grupomahue.online"
ANALYZER_AGENT = "analyzer"
class AnalyzerControllerAgent(Agent):
    class InformBehav(OneShotBehaviour):
        async def run(self):
            print("[InformBehav] Iniciando Analyzer Controller: analyzer_controller@" + self.agent.server_jid)
            msg = Message(to="client1@" + self.agent.server_jid)     # Instantiate the message
            content = {"method": "GETBYTAGNAME",
                        "param": "input"}
            msg.body = json.dumps(content)                    # Set the message content

            await self.send(msg)
            try:
                result = await self.receive(timeout=2000)
                if result:
                    print("[InformBehav] Se recibe respuestas commando: ")
                    print(result.body)
                    
                else:
                    print("[InformBehav] Sin respuesta recibida")
            except Exception:
                print("[InformBehav] Se recibio un mensaje con errores")
                # set exit_code for the behaviour
            self.exit_code = "[InformBehav] Finalizando el comportamiento"

            # stop agent from behaviour
            # await self.agent.stop()
    class AnalyzerBehav(CyclicBehaviour):
        async def run(self):
            print("[AnalyzerBehav] Iniciando comportamiento de recepcion")
            try:
                result = await self.receive(timeout=2000)
                if result:
                    print("[AnalyzerBehav] Se recibe mensaje")
                    message = json.loads(result.body)
                    analyzer_user_name  = result.sender.localpart
                    if analyzer_user_name == ANALYZER_AGENT:
                        self.agent.processAgentMessage(message)
                    else:
                        self.agent.processClientMessage(message)
                else:
                    print("[AnalyzerBehav] Timeout de recepcion")
            except Exception:
                print("[AnalyzerBehav] Se recibio un mensaje con errores")
                # set exit_code for the behaviour

            # stop agent from behaviour
            # await self.agent.stop()
    def getErrorText(self, error):
        if error=="1.1.1":
            response = {}
            response["observationText"] = "Todo contenido no textual que se presenta al usuario tiene una alternativa textual que cumple el mismo propósito, excepto en las situaciones enumeradas a continuación."
            response["observationType"] = "ERROR"
            return response
    def processAgentMessage(self, message):
        print("[processAgentMessage] Procesando pedido desde el agente")
        if message['command'] == 'getImage':
            print("[processAgentMessage] Comando desde el agente analizador reconocido")
            class GetByIdBehaviour(OneShotBehaviour):
                async def run(self):
                    print("[processAgentMessage] Comenzaod el envio de pedido al cliente","client1@" + self.agent.server_jid)
                    msg = Message(to="client1@" + self.agent.server_jid)     # Instantiate the message
                    #msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    content = {"method": "GETBYTAGNAME",
                        "param": "img"}
                    msg.body = json.dumps(content)
                    await self.send(msg)
                    try:
                        result = await self.receive(timeout=2000)
                        if result:
                            print("[processAgentMessage] Se recibe respuestas commando: ")
                            message = json.loads(result)
                            self.agent.processClientMessage(message)
                        else:
                            print("[processAgentMessage] Sin respuesta recibida")
                    except Exception:
                        print("[processAgentMessage] Se recibio un mensaje con errores")
            b = GetByIdBehaviour()
            self.add_behaviour(b)

        elif message['command']=='sendError':
            print("[processAgentMessage] Enviando error al cliente")
            class SendErrorBehaviour(OneShotBehaviour):
                async def run(self):
                    print("[processAgentMessage] Comenzando el envio del error al cliente","client1@" + self.agent.server_jid)
                    msg = Message(to="client1@" + self.agent.server_jid)
                    #TODO recuperacion del texto del error
                    error = self.agent.getErrorText(message["param"]["error"])
                    content = {"method": "SETOBSERVATION",
                        "param": {
                            "xpath":message['param']['xpath'],
                            "observationType": error['obsertionType'],
                            "observationText": error['obsertionText']
                        }}
                    msg.body = json.dumps(content)
                    await self.send(msg)
            b = SendErrorBehaviour()
            self.add_behaviour(b)
    def processImageTag(self, tagInfo):
        result = []
        if tagInfo['tagName']=='img':
            class SendErrorBehaviour(OneShotBehaviour):
                async def run(self):
                    print("[processClientMessage] Enviando informacion de las imagenes recibidas desde el cliente")
                    for attribute in tagInfo['attributes']:
                        msg = Message(to="analyzer@" + self.agent.server_jid)     # Instantiate the message
                        msg.set_metadata("performative", "inform")  
                        content = {"predicate": 'attribute', 'value1': tagInfo['fullXPath'], 'value2':attribute[0], 'value3':attribute[1]}
                        msg.body = json.dumps(content)                    # Set the message content
                        await self.send(msg)
                    msg = Message(to="analyzer@" + self.agent.server_jid)     # Instantiate the message
                    msg.set_metadata("performative", "inform")  
                    content = {"predicate": 'image', 'value': tagInfo['fullXPath']}
                    msg.body = json.dumps(content)                    # Set the message content
                    await self.send(msg)
            b = SendErrorBehaviour()
            self.add_behaviour(b)
        

    def processClientMessage(self, message):
        print("[processClientMessage] Procesando respuesta del cliente", message)

        if "reason" in message:
            if message["reason"] == "RESPONSE":
                if message['responseTo'] == 'GETBYTAGNAME':
                    if(message['responseToParameter']=='img'):
                        for image in message['resultado']:
                            content = {"predicate": ""}
                            print("[processClientMessage] Agregando", image)
                            self.processImageTag(image)
            elif message["reason"]=="EVALUATE":
                print("Se procede a evaluar ")
                ##Se procesa el mensaje como el inicial para el analisis
                class SendErrorBehaviour(OneShotBehaviour):
                    async def run(self):
                        print("[processClientMessage] Comenzando el envio para el procesamuiento de la barrera")
                        msg = Message(to="analyzer@" + self.agent.server_jid)     # Instantiate the message
                        msg.set_metadata("performative", "inform")  
                        content = {"predicate": "barrera",
                                    "value": 2}
                        msg.body = json.dumps(content)                    # Set the message content
                        await self.send(msg)
                b = SendErrorBehaviour()
                self.add_behaviour(b)

    def __init__(self, jid:str, password: str, verify_security: bool = False):
        self.server_jid = ""
        self.facts =[]
        super().__init__(jid, password, verify_security)

    async def setup(self):
        print("Analyzer Controller started")
        #self.b = self.InformBehav()
        self.a = self.AnalyzerBehav()
        
        #self.add_behaviour(self.b)
        self.add_behaviour(self.a)


if __name__ == "__main__":
    print("Comenzando la ejecucion del agente controlador")
    parser = argparse.ArgumentParser(description='Controller Agent for Profiling')
    parser.add_argument('--server', type=str, default="test.grupomahue.online", help='XMPP server address.')
    parser.add_argument('--password', type=str, default="12345", help='XMPP password for the agents.')
    #parser.add_argument('--questionnaire_facts', type=str, default=0, help='Questionnaire Facts')
    args = parser.parse_args()
    #parseo = json.loads(args.questionnaire_facts)
    agent = AnalyzerControllerAgent("analizer_agent_controller@" + args.server, args.password)
    agent.server_jid = args.server
    #agent.facts = parseo
    future = agent.start()
    #agent.web.start(hostname="127.0.0.1", port="10001")
    future.result()

    while agent.is_alive():
        try:
            time.sleep(1)
        except KeyboardInterrupt:
            agent.stop()
            break
    print("Agent finished with exit code: {}".format(agent.b.exit_code))