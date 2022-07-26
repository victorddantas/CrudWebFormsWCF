using GTIMVC.MODEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class ClienteDao
    {

        #region Inserir
        //------------------------------------------------------------------------------------------
        public int Inserir(Cliente cliente)
        {
            int idCliente = 0;
            SqlConnection con = null;

            try
            {
                string strConexao = ConfigurationManager.ConnectionStrings["conAlex"].ConnectionString;
                con = new SqlConnection(strConexao);
                con.Open();


                SqlCommand cmd = new SqlCommand("USP_I_CLIENTE", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Nome", cliente.Nome);
                cmd.Parameters.AddWithValue("@Cpf", cliente.Cpf);
                cmd.Parameters.AddWithValue("@Rg", cliente.Rg);
                cmd.Parameters.AddWithValue("@UfExpedicao", cliente.UfExpedicao);
                cmd.Parameters.AddWithValue("@Sexo", cliente.Sexo);
                cmd.Parameters.AddWithValue("@EstadoCivil", cliente.EstadoCivil);
                cmd.Parameters.AddWithValue("@DataNascimento", Convert.ToDateTime(cliente.DataNascimento));
                cmd.Parameters.AddWithValue("@DataExpedicao", Convert.ToDateTime(cliente.DataExpedicao));

                cmd.Parameters.AddWithValue("@Endereco", cliente.Logradouro);
                cmd.Parameters.AddWithValue("@Complemento", cliente.Complemento);
                cmd.Parameters.AddWithValue("@Numero", cliente.Numero);
                cmd.Parameters.AddWithValue("@Bairro", cliente.Bairro);
                cmd.Parameters.AddWithValue("@Cep", cliente.Cep);
                cmd.Parameters.AddWithValue("@Cidade", cliente.Cidade);
                cmd.Parameters.AddWithValue("@Uf", cliente.Uf);

                idCliente = Convert.ToInt32(cmd.ExecuteScalar());
            }
            finally
            {
                if (con != null)
                    con.Close();
            }
            return idCliente;
        }
        #endregion
        //---------------------------------------------------------------------------------------
        #region Atualizar
        public void Atualizar(Cliente cliente)
        {
            SqlConnection con = null;

            try
            {
                string strConexao = ConfigurationManager.ConnectionStrings["conAlex"].ConnectionString;
                con = new SqlConnection(strConexao);
                con.Open();

                SqlCommand cmd = new SqlCommand("USP_U_CLIENTE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", cliente.Id);
                cmd.Parameters.AddWithValue("@Nome", cliente.Nome);
                cmd.Parameters.AddWithValue("@Cpf", cliente.Cpf);
                cmd.Parameters.AddWithValue("@Rg", cliente.Rg);

                cmd.Parameters.AddWithValue("@UfExpedicao", cliente.UfExpedicao);
                cmd.Parameters.AddWithValue("@Sexo", cliente.Sexo);
                cmd.Parameters.AddWithValue("@EstadoCivil", cliente.EstadoCivil);
                cmd.Parameters.AddWithValue("@DataNascimento", cliente.DataNascimento);
                cmd.Parameters.AddWithValue("@DataExpedicao", cliente.DataExpedicao);


                cmd.Parameters.AddWithValue("@Endereco", cliente.Logradouro);
                cmd.Parameters.AddWithValue("@Complemento", cliente.Complemento);
                cmd.Parameters.AddWithValue("@Numero", cliente.Numero);
                cmd.Parameters.AddWithValue("@Bairro", cliente.Bairro);
                cmd.Parameters.AddWithValue("@Cidade", cliente.Cidade);
                cmd.Parameters.AddWithValue("@Cep", cliente.Cep);
                cmd.Parameters.AddWithValue("@Uf", cliente.Uf);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                if (con != null)
                    con.Close();
            }
        }
        #endregion
        //---------------------------------------------------------------------------------------
        #region Excluir
        public void Excluir(int id)
        {
            SqlConnection con = null;

            try
            {
                string strConexao = ConfigurationManager.ConnectionStrings["conAlex"].ConnectionString;
                con = new SqlConnection(strConexao);
                con.Open();

                SqlCommand cmd = new SqlCommand("USP_D_CLIENTE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                if (con != null)
                    con.Close();
            }
        }
        #endregion
        //---------------------------------------------------------------------------------------
        #region Listar
        public List<Cliente> Listar()
        {
            SqlConnection con = null;
            List<Cliente> lstCliente = null;

            try
            {
                string strConexao = ConfigurationManager.ConnectionStrings["conAlex"].ConnectionString;


                con = new SqlConnection(strConexao);
                con.Open();

                SqlCommand cmd = new SqlCommand("USP_L_CLIENTE", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader radClientes = cmd.ExecuteReader();
                lstCliente = new List<Cliente>();


                while (radClientes.Read())
                {
                    Cliente cliente = new Cliente
                    {
                        Id = Convert.ToInt32(radClientes["Id"]),
                        Nome = (string)radClientes["Nome"],
                        Cpf = (string)radClientes["Cpf"],
                        Rg = (string)(radClientes["Rg"]),
                        OrgaoExpedicao = (string)(radClientes["UfExpedicao"]),
                        UfExpedicao = (string)radClientes["UfExpedicao"],
                        Sexo = (string)radClientes["Sexo"],
                        EstadoCivil = (string)radClientes["EstadoCivil"],
                        DataNascimento = Convert.ToDateTime(radClientes["DataNascimento"]),
                        DataExpedicao = Convert.ToDateTime(radClientes["DataExpedicao"]),


                        Logradouro = (string)radClientes["Endereco"],
                        Complemento = (string)radClientes["Complemento"],
                        Numero = (string)radClientes["Numero"],
                        Bairro = (string)radClientes["Bairro"],
                        Cidade = (string)radClientes["Cidade"],
                        Cep = (string)radClientes["Cep"],
                        Uf = (string)radClientes["Uf"],
                    };


                    lstCliente.Add(cliente);
                }

            }
            finally
            {
                if (con != null)
                    con.Close();
            }

            return lstCliente;
        }
        #endregion
        //---------------------------------------------------------------------------------------
        #region Obter
        public Cliente Obter(int id)
        {
            SqlConnection con = null;
            Cliente cliente = null;

            try
            {
                string strConexao = ConfigurationManager.ConnectionStrings["conAlex"].ConnectionString;
                con = new SqlConnection(strConexao);
                con.Open();

                SqlCommand cmd = new SqlCommand("USP_O_CLIENTE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id", id);

                SqlDataReader radClientes = cmd.ExecuteReader();


                if (radClientes.Read())
                {
                    cliente = new Cliente();

                    cliente.Id = Convert.ToInt32(radClientes["Id"]);
                    cliente.Nome = (string)radClientes["Nome"];
                    cliente.Cpf = (string)radClientes["Cpf"];
                    cliente.Rg = (string)(radClientes["Rg"]);
                    cliente.OrgaoExpedicao = (string)(radClientes["UfExpedicao"]);
                    cliente.UfExpedicao = (string)radClientes["Uf"];
                    cliente.Sexo = (string)radClientes["Sexo"];
                    cliente.EstadoCivil = (string)radClientes["EstadoCivil"];
                    cliente.DataNascimento = Convert.ToDateTime(radClientes["DataNascimento"]);
                    cliente.DataExpedicao = Convert.ToDateTime(radClientes["DataExpedicao"]);

                    cliente.Logradouro = (string)radClientes["Endereco"];
                    cliente.Complemento = (string)radClientes["Complemento"];
                    cliente.Numero = (string)radClientes["Numero"];
                    cliente.Bairro = (string)radClientes["Bairro"];
                    cliente.Cidade = (string)radClientes["Cidade"];
                    cliente.Cep = (string)radClientes["Cep"];
                    cliente.Uf = (string)radClientes["Uf"];
                }

            }
            finally
            {
                if (con != null)
                    con.Close();
            }

            return cliente;
        }
        #endregion
        //---------------------------------------------------------------------------------------
    }
}

