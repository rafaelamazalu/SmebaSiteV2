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


class AGP(BDIAgent):
    class MyBehaviour(CyclicBehaviour):
        async def on_start(self):
            print("Starting behaviour . . .")

        async def run(self):
            print("RecvBehav running")
            msg = await self.receive(timeout=5)  # wait for a message for 10 seconds
            if msg:
<<<<<<< HEAD
                print("Message received with content: {}".format(msg.body))
                print("From: {}".format(msg.sender))
                self.agent.controller_jid = msg.sender
                knowledge = json.loads(msg.body)
                #print("Agregando conocimiento al agente {}, value: X",knowledge.predicate)
                self.agent.bdi.set_belief(knowledge["predicate"],knowledge["value"])
=======
                #print("Message received with content: {}".format(msg.body))
                print("From: {}".format(msg.sender))
                self.agent.controller_jid = msg.sender
                knowledge = json.loads(msg.body)
                for item in knowledge:
                    if "value2" in item:
                        self.agent.bdi.set_belief(item['predicate'], item['value1'], item['value2'])
                    else:
                        if "value1" in item:
                            self.agent.bdi.set_belief(item['predicate'], item['value1'])
                        else:
                            self.agent.bdi.set_belief(item['predicate'], item['value'])
                print("Comenzando con el analisis")
                self.agent.bdi.set_belief('startanalysis')
                print("Finalizacion del analisis")
                    
>>>>>>> b8bbdb783c1aa74c5296c06ffbd9a681217a3145
            else:
                print("Did not received any message after 10 seconds")

    def __init__(self, jid: str, password: str, asl: str, actions=None, *args, **kwargs):
        local_actions = Actions(asp_action)
        controller_jid = ""

        @local_actions.add(".updateDatabaseProfile", 1)
        def _updateDatabaseProfile(agent, term, intention):
            args = asp.grounded(term.args, intention.scope)
            class UpdateDatabaseBehaviour(OneShotBehaviour):
                async def run(self):
                    await self.agent.sendResponse(args[0])

            b = UpdateDatabaseBehaviour()
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
<<<<<<< HEAD
                result = await self.receive(timeout=20)
                self.exit_code = "Respuesta enviada"
=======
                self.exit_code = "Respuesta enviada: " + status
>>>>>>> b8bbdb783c1aa74c5296c06ffbd9a681217a3145
        print("Enviando notificacion de vuelta a" + str(self.controller_jid))
        print(status)
        self.add_behaviour(ResponseBehav())

    async def setup(self):
        print("Agent starting . . .")
        b = self.MyBehaviour()
        template = Template()
        template.set_metadata("performative","inform")
        self.add_behaviour(b, template)
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='spade bdi master-server example')
<<<<<<< HEAD
    parser.add_argument('--server', type=str, default="localhost", help='XMPP server address.')
=======
    parser.add_argument('--server', type=str, default="fabian-dellin", help='XMPP server address.')
>>>>>>> b8bbdb783c1aa74c5296c06ffbd9a681217a3145
    parser.add_argument('--password', type=str, default="profiler", help='XMPP password for the agents.')
    args = parser.parse_args()
    a = AGP("profiler@" + args.server, args.password, "profiler.asl",verify_security=False)
    future = a.start()
    a.web.start(hostname="127.0.0.1", port="10000")
    future.result()
    import time
    try:
        while a.is_alive():
            time.sleep(1)
    except KeyboardInterrupt:
        a.stop()
        print("Stopping...")
