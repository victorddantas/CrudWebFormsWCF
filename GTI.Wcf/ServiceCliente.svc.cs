using GTI.API.Models;
using GTI.BL;
using System.Collections.Generic;

namespace GTI.Wcf
{
    // OBSERVAÇÃO: Você pode usar o comando "Renomear" no menu "Refatorar" para alterar o nome da classe "ServiceCliente" no arquivo de código, svc e configuração ao mesmo tempo.
    // OBSERVAÇÃO: Para iniciar o cliente de teste do WCF para testar esse serviço, selecione ServiceCliente.svc ou ServiceCliente.svc.cs no Gerenciador de Soluções e inicie a depuração.
    public class ServiceCliente : IServiceCliente
    {
        public List<Cliente> Listar()
        {
            ClienteBL clienteBL = new ClienteBL();
            return clienteBL.Listar();
        }
        public Cliente Obter(int id)
        {
            ClienteBL clienteBL = new ClienteBL();
            return clienteBL.Obter(id);
        }
        public int Incluir(Cliente cliente)
        {
            ClienteBL clienteBL = new ClienteBL();
            return clienteBL.Iserir(cliente);
        }
        public void Excluir(int id)
        {
            ClienteBL clienteBL = new ClienteBL();
            clienteBL.Excluir(id);
        }

        public void Alterar(Cliente cliente)
        {
            ClienteBL clienteBL = new ClienteBL();
            clienteBL.Atualizar(cliente);
        }
    }
}
