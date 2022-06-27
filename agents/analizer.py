import argparse
import asyncio
import json
from mimetypes import knownfiles
from pipes import Template

from spade_bdi.bdi import BDIAgent
import agentspeak as asp
from agentspeak import Actions
from agentspeak.stdlib import actions as asp_action
from spade.behaviour import OneShotBehaviour, CyclicBehaviour
from spade.template import Template
from spade.message import Message


class Analyzer(BDIAgent):
    class AnalyzerBehab(CyclicBehaviour):
        async def on_start(self):
            print("Starting analyzer behaviour...")

        async def run(self):
            print("[AnalyzerAgentBehav] Esperando mensaje")
            try:
                msg = await self.receive(timeout=500)  # wait for a message for 10 seconds
                if msg:
                    print("Message received with content: {}".format(msg.body))
                    self.agent.controller_jid = msg.sender
                    knowledge = json.loads(msg.body)
                    if "value3" in knowledge:
                        self.agent.bdi.set_belief(knowledge["predicate"], knowledge["value1"],knowledge["value2"],knowledge["value3"])
                    elif "value2" in knowledge:
                        self.agent.bdi.set_belief(knowledge["predicate"], knowledge["value1"],knowledge["value2"])
                    elif "value1" in knowledge:
                        self.agent.bdi.set_belief(knowledge["predicate"], knowledge["value1"])    
                    else:
                        self.agent.bdi.set_belief(knowledge["predicate"], knowledge["value"])    

                else:
                    print("Did not received any message after 10 seconds")
            except Exception:
                print("[AnalyzerAgentBehav] Se recibe mensaje incorrecto")
    

    def __init__(self, jid: str, password: str, asl: str, actions=None, *args, **kwargs):
        local_actions = Actions(asp_action)
        self.controller_jid = "analizer_agent_controller@test.grupomahue.online"

        @local_actions.add(".error", 1)
        def _error(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class SendErrorBehaviour(OneShotBehaviour):
                async def run(self):
                    msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                    msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    msg.body = {args[0]}
                    await self.send(msg)
                    self.exit_code = "Respuesta enviada"
            b = SendErrorBehaviour()
            self.add_behaviour(b)
            yield
        
        @local_actions.add(".getById", 1)
        def _getById(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class GetByIdBehaviour(OneShotBehaviour):
                async def run(self):
                    msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                    msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    msg.body = {args[0]}
                    await self.send(msg)
                    self.exit_code = "Respuesta enviada"
            b = GetByIdBehaviour()
            self.add_behaviour(b)
            yield

        @local_actions.add(".getImageTag", 1)
        def _getImageTag(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class GetImageTagBehaviour(OneShotBehaviour):
                async def run(self):
                    print("Enviando mensaje: ", args[0])
                    msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                    msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    msg.body = json.dumps({"command":"getImage","param":args[0]})
                    #msg.body = json.dumps({"command":"sendError","param":{"Xpath": args[0], "error":"1.1.1"}})
                    await self.send(msg)
            b = GetImageTagBehaviour()
            self.add_behaviour(b)
            yield
        
        @local_actions.add(".childTag", 2)
        def _childTag(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class ChildTagBehaviour(OneShotBehaviour):
                async def run(self):
                    msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                    msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    msg.body = {args[0]}
                    await self.send(msg)
                    self.exit_code = "Respuesta enviada"
            b = ChildTagBehaviour()
            self.add_behaviour(b)
            yield

        @local_actions.add(".getTrackAudio", 1)
        def _getTrackAudio(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class GetTrackAudioBehaviour(OneShotBehaviour):
                async def run(self):
                    msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                    msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    msg.body = {args[0]}
                    await self.send(msg)
                    self.exit_code = "Respuesta enviada"
            b = GetTrackAudioBehaviour()
            self.add_behaviour(b)
            yield
        
        @local_actions.add(".error", 2)
        def _error(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class SendErrorBehaviour(OneShotBehaviour):
                async def run(self):
                    msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                    msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                    msg.body = json.dumps({"command":"sendError","param":{"xpath":args[0], "error": args[1]}})
                    await self.send(msg)
                    self.exit_code = "Respuesta enviada"
            b = SendErrorBehaviour()
            self.add_behaviour(b)
            yield

        super().__init__(jid, password, asl, actions=local_actions, *args, **kwargs)
    
        

    async def sendResponse(self, status):
        class ResponseBehav(OneShotBehaviour):
            async def run(self):
                msg = Message(to=str(self.agent.controller_jid))     # Instantiate the message
                msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
                msg.body = json.dumps(status)                    # Set the message content

                await self.send(msg)
                result = await self.receive(timeout=20)
                self.exit_code = "Respuesta enviada"
        print("Enviando notificacion de vuelta a" + str(self.controller_jid))
        print(status)
        self.add_behaviour(ResponseBehav())

    async def setup(self):
        print("Agent starting . . .")
        b = self.AnalyzerBehab()
        template = Template()
        template.set_metadata("performative","inform")
        self.add_behaviour(b, template)
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Analyzer agent for WAMAS')
    parser.add_argument('--server', type=str, default="test.grupomahue.online", help='XMPP server address.')
    parser.add_argument('--password', type=str, default="12345", help='XMPP password for the agents.')
    args = parser.parse_args()
    a = Analyzer("analyzer@" + args.server, args.password, "analyzer.asl",verify_security=False)
    future = a.start()
    #a.web.start(hostname="127.0.0.1", port="10000")
    future.result()
    import time
    try:
        while a.is_alive():
            time.sleep(1)
    except KeyboardInterrupt:
        a.stop()
        print("Stopping...")
