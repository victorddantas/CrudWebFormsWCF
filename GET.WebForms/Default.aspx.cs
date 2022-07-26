

using GTI.API.Models;
using GTI.Wcf;
using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GET.WebForms
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarClientes();
            CarregarDropDownLists();
        }
        private void CarregarClientes()
        {
            ServiceCliente serviceCliente = new ServiceCliente();
            var clientes = serviceCliente.Listar();

            gdvClientes.DataSource = clientes;
            gdvClientes.DataBind();
        }

        public int Id
        {
            get
            {
                if (ViewState["Id"] != null)

                    return (int)ViewState["Id"];
                return 0;
            }
            set
            {
                ViewState["Id"] = value;
            }

        }

        private void CarregarDropDownLists()
        {


            ListItem ltiSelecione = new ListItem();
            ddlUfExpedicao.Items.Insert(0, ltiSelecione);


            ListItem ltiSelecioneEstado = new ListItem();
            ddlUfEstado.Items.Insert(0, ltiSelecioneEstado);

            ListItem ltiSelecioneSexo = new ListItem();
            ddlSexo.Items.Insert(0, ltiSelecioneSexo);

            ListItem ltiEstadoCivil = new ListItem();
            ddlEstadoCivil.Items.Insert(0, ltiEstadoCivil);


        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {

            CultureInfo ctiBr = new CultureInfo("pt-BR");

            Cliente cliente = new Cliente();


            cliente.Nome = txtNome.Text;
            cliente.Cpf = txtCpf.Text;
            cliente.Rg = txtRg.Text;
            cliente.OrgaoExpedicao = txtOrgaoExpedidor.Text;
            cliente.UfExpedicao = ddlUfExpedicao.Text;
            cliente.Sexo = ddlSexo.Text;
            cliente.EstadoCivil = ddlEstadoCivil.Text;
            cliente.DataNascimento = DateTime.Parse(txtDataNascimento.Text, ctiBr);
            cliente.DataExpedicao = DateTime.Parse(txtDataExpedicao.Text, ctiBr);

            cliente.Complemento = txtComplemento.Text;
            cliente.Numero = txtNumero.Text;
            cliente.Bairro = txtBairro.Text;
            cliente.Logradouro = txtRua.Text;
            cliente.Cep = txtCep.Text;
            cliente.Cidade = txtCidade.Text;
            cliente.Uf = ddlUfEstado.Text;

            cliente.Id = Id;

            if (cliente.Id == 0)
            {
                ServiceCliente serviceCliente = new ServiceCliente();

                
                int id = serviceCliente.Incluir(cliente);

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alerta", "alert('Registro Inserido com sucesso.');", true);

                LimparCampos();
            }
            else
            {
                ServiceCliente serviceCliente = new ServiceCliente();
                serviceCliente.Alterar(cliente);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alerta", "alert('Registro Alterado com sucesso.');", true);

                LimparCampos();

            }
             
            CarregarClientes();
        }

        private void LimparCampos()
        {
            txtNome.Text = "";
            txtCpf.Text = "";
            txtRg.Text = "";
            txtOrgaoExpedidor.Text = "";
            ddlUfExpedicao.Text = "";
            ddlSexo.Text = "";
            ddlEstadoCivil.Text = "";
            txtDataNascimento.Text = "";
            txtDataExpedicao.Text = "";

            txtComplemento.Text = "";
            txtNumero.Text = "";
            txtBairro.Text = "";
            txtRua.Text = "";
            txtCep.Text = "";
            txtCidade.Text = "";
            ddlUfEstado.Text = "";
        }

        protected void gdvClientes_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

            CultureInfo ctiBr = new CultureInfo("pt-BR");


            ServiceCliente serviceCliente = new ServiceCliente();

            if (e.CommandName == "Editar")
            {
                Id = Convert.ToInt32(e.CommandArgument);
                int ClienteId = Convert.ToInt32(e.CommandArgument);

                Cliente cliente = serviceCliente.Obter(ClienteId);

                CamposHabilitados();

                txtNomeDetalhes.Text = cliente.Nome;
                txtCpfDetalhes.Text = cliente.Cpf;
                txtRgDetalhes.Text = cliente.Rg;
                txtOrgaoExpedidorDetalhes.Text = cliente.OrgaoExpedicao;
                txtUfExpedidorDetalhes.Text = cliente.UfExpedicao;
                txtSexoDetalhes.Text = cliente.Sexo;
                txtEstadoCivilDetalhes.Text = cliente.EstadoCivil;
                txtDataNascimentoDetalhes.Text = cliente.DataNascimento.ToString("d", ctiBr);
                txtDataExpedicaoDetalhes.Text = cliente.DataExpedicao.ToString("d", ctiBr);
                txtRuaDetalhes.Text = cliente.Logradouro;
                txtComplementoDetalhes.Text = cliente.Complemento;
                txtNumeroDetalhes.Text = cliente.Numero;
                txtBairroDetalhes.Text = cliente.Bairro;
                txtCepDetalhes.Text = cliente.Cep;
                txtCidadeDetalhes.Text = cliente.Cidade;
                txtUfDetalhes.Text = cliente.Uf;

                panelDetalhes.Visible = true;
                panelCadastroCliente.Visible = false;
                btnSalvarAlteracao.Visible = true;



            }

            if (e.CommandName == "Excluir")
            {
                Id = Convert.ToInt32(e.CommandArgument);
                serviceCliente.Excluir(Id);

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alerta", "alert('Dados Excluidos com sucesso.');", true);
                Response.Redirect("Default.aspx");
            }

            if (e.CommandName == "Detalhes")
            {
                Id = Convert.ToInt32(e.CommandArgument);
                int ClienteId = Convert.ToInt32(e.CommandArgument);

                //PanelCadastroVisivel(true);
                Cliente cliente = serviceCliente.Obter(ClienteId);

                CamposDesabilitados();

                txtNomeDetalhes.Text = cliente.Nome;
                txtCpfDetalhes.Text = cliente.Cpf;
                txtRgDetalhes.Text = cliente.Rg;
                txtOrgaoExpedidorDetalhes.Text = cliente.OrgaoExpedicao;
                txtUfExpedidorDetalhes.Text = cliente.UfExpedicao;
                txtSexoDetalhes.Text = cliente.Sexo;
                txtEstadoCivilDetalhes.Text = cliente.EstadoCivil;
                txtDataNascimentoDetalhes.Text = cliente.DataNascimento.ToString("d", ctiBr);
                txtDataExpedicaoDetalhes.Text = cliente.DataExpedicao.ToString("d", ctiBr);
                txtRuaDetalhes.Text = cliente.Logradouro;
                txtComplementoDetalhes.Text = cliente.Complemento;
                txtNumeroDetalhes.Text = cliente.Numero;
                txtBairroDetalhes.Text = cliente.Bairro;
                txtCepDetalhes.Text = cliente.Cep;
                txtCidadeDetalhes.Text = cliente.Cidade;
                txtUfDetalhes.Text = cliente.Uf;

                panelDetalhes.Visible = true;
                panelCadastroCliente.Visible = false;
                btnSalvarAlteracao.Visible = false;
            }
        }

        private void CamposDesabilitados()
        {
            txtNomeDetalhes.Enabled = false;
            txtNomeDetalhes.BackColor = System.Drawing.Color.LightGray;
            txtCpfDetalhes.Enabled = false;
            txtCpfDetalhes.BackColor = System.Drawing.Color.LightGray;
            txtRgDetalhes.Enabled = false;
            txtRgDetalhes.BackColor = System.Drawing.Color.LightGray;
            txtOrgaoExpedidorDetalhes.BackColor = System.Drawing.Color.LightGray;
            txtOrgaoExpedidorDetalhes.Enabled = false;
            txtUfExpedidorDetalhes.Enabled = false;
            txtUfExpedidorDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtSexoDetalhes.Enabled = false;
            txtSexoDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtEstadoCivilDetalhes.Enabled = false;
            txtEstadoCivilDetalhes.BackColor = System.Drawing.Color.LightGray;


            txtDataNascimentoDetalhes.Enabled = false;
            txtDataNascimentoDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtDataExpedicaoDetalhes.Enabled = false;
            txtDataExpedicaoDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtRuaDetalhes.Enabled = false;
            txtRuaDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtComplementoDetalhes.Enabled = false;
            txtComplementoDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtNumeroDetalhes.Enabled = false;
            txtNumeroDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtBairroDetalhes.Enabled = false;
            txtBairroDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtCepDetalhes.Enabled = false;
            txtCepDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtCidadeDetalhes.Enabled = false;
            txtCidadeDetalhes.BackColor = System.Drawing.Color.LightGray;

            txtUfDetalhes.Enabled = false;
            txtUfDetalhes.BackColor = System.Drawing.Color.LightGray;
        }
        private void CamposHabilitados()
        {
            txtNomeDetalhes.Enabled = true;
            txtNomeDetalhes.BackColor = System.Drawing.Color.White;
            txtCpfDetalhes.Enabled = true;
            txtCpfDetalhes.BackColor = System.Drawing.Color.White;
            txtRgDetalhes.Enabled = true;
            txtRgDetalhes.BackColor = System.Drawing.Color.White;
            txtOrgaoExpedidorDetalhes.BackColor = System.Drawing.Color.White;
            txtOrgaoExpedidorDetalhes.Enabled = true;
            txtUfExpedidorDetalhes.Enabled = true;
            txtUfExpedidorDetalhes.BackColor = System.Drawing.Color.White;

            txtSexoDetalhes.Enabled = true;
            txtSexoDetalhes.BackColor = System.Drawing.Color.White;

            txtEstadoCivilDetalhes.Enabled = true;
            txtEstadoCivilDetalhes.BackColor = System.Drawing.Color.White;


            txtDataNascimentoDetalhes.Enabled = true;
            txtDataNascimentoDetalhes.BackColor = System.Drawing.Color.White;

            txtDataExpedicaoDetalhes.Enabled = true;
            txtDataExpedicaoDetalhes.BackColor = System.Drawing.Color.White;

            txtRuaDetalhes.Enabled = true;
            txtRuaDetalhes.BackColor = System.Drawing.Color.White;

            txtComplementoDetalhes.Enabled = true;
            txtComplementoDetalhes.BackColor = System.Drawing.Color.White;

            txtNumeroDetalhes.Enabled = true;
            txtNumeroDetalhes.BackColor = System.Drawing.Color.White;

            txtBairroDetalhes.Enabled = true;
            txtBairroDetalhes.BackColor = System.Drawing.Color.White;

            txtCepDetalhes.Enabled = true;
            txtCepDetalhes.BackColor = System.Drawing.Color.White;

            txtCidadeDetalhes.Enabled = true;
            txtCidadeDetalhes.BackColor = System.Drawing.Color.White;

            txtUfDetalhes.Enabled = true;
            txtUfDetalhes.BackColor = System.Drawing.Color.White;
        }

        protected void txtVoltar_Click(object sender, EventArgs e)
        {
            panelDetalhes.Visible = false;
            panelCadastroCliente.Visible = true;
            LimparCampos();
        }

    }
}