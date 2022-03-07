import time
import argparse
import json
from spade.agent import Agent
from spade.behaviour import OneShotBehaviour
from spade.message import Message


class SenderAgent(Agent):
    class InformBehav(OneShotBehaviour):
        async def run(self):
            print("InformBehav running, preparing message to: profiler@" + self.agent.server_jid)
            msg = Message(to="profiler@" + self.agent.server_jid)     # Instantiate the message
            msg.set_metadata("performative", "inform")  # Set the "inform" FIPA performative
            content = {"predicate": "declara_ceguera",
                        "value": 1}
            msg.body = json.dumps(self.agent.facts)                    # Set the message content

            await self.send(msg)
            result = await self.receive(timeout=20)
            if result:
                print("Se recibe respuesta: " + result.body)
                await self.agent.stop()  

            # set exit_code for the behaviour
            self.exit_code = "Job Finished!"

            # stop agent from behaviour
            # await self.agent.stop()

    def __init__(self, jid:str, password: str, verify_security: bool = False):
        self.server_jid = ""
        self.facts =[]
        super().__init__(jid, password, verify_security)

    async def setup(self):
        print("SenderAgent started")
        self.b = self.InformBehav()
        self.add_behaviour(self.b)


if __name__ == "__main__":
    print("Comenzando la ejecucion del agente controlador")
    parser = argparse.ArgumentParser(description='Controller Agent for Profiling')
    parser.add_argument('--server', type=str, default="fabian-dellin", help='XMPP server address.')
    parser.add_argument('--password', type=str, default="controller", help='XMPP password for the agents.')
    parser.add_argument('--questionnaire_facts', type=str, default=0, help='Questionnaire Facts')
    args = parser.parse_args()
    print("Finalizacion de la recuperacion de los parametros")
    #print(args.questionnaire_facts)
    parseo = json.loads(args.questionnaire_facts)
    agent = SenderAgent("controller@" + args.server, args.password)
    agent.server_jid = args.server
    agent.facts = parseo
    future = agent.start()
    ##agent.web.start(hostname="127.0.0.1", port="10001")
    future.result()

    #while agent.is_alive():
    #    try:
    #        time.sleep(1)
    #    except KeyboardInterrupt:
    #        agent.stop()
    #        break
    #print("Agent finished with exit code: {}".format(agent.b.exit_code))