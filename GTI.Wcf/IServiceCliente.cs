
using GTI.API.Models;
using System.Collections.Generic;
using System.ServiceModel;

namespace GTI.Wcf
{
    // OBSERVAÇÃO: Você pode usar o comando "Renomear" no menu "Refatorar" para alterar o nome da interface "IServiceCliente" no arquivo de código e configuração ao mesmo tempo.
    [ServiceContract]
    public interface IServiceCliente
    {
        [OperationContract]
        List<Cliente> Listar();

        [OperationContract]
        Cliente Obter(int id);

        [OperationContract]
        int Incluir(Cliente cliente);

        [OperationContract]
        void Alterar(Cliente cliente);
        [OperationContract]
        void Excluir(int id);
    }
}
