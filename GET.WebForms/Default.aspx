<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GET.WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">


        function validarCPF(source, args) {
            var cpf = document.getElementById('<%= txtCpf.ClientID %>').value;
            var filtro = /^\d{3}.\d{3}.\d{3}-\d{2}$/i;

            if (!filtro.test(cpf)) {
                args.IsValid = false;
                return false;
            }

            cpf = remove(cpf, ".");
            cpf = remove(cpf, "-");

            if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" ||
                cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" ||
                cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" ||
                cpf == "88888888888" || cpf == "99999999999") {
                args.IsValid = false;
                return false;
            }

            soma = 0;
            for (i = 0; i < 9; i++) {
                soma += parseInt(cpf.charAt(i)) * (10 - i);
            }

            resto = 11 - (soma % 11);
            if (resto == 10 || resto == 11) {
                resto = 0;
            }
            if (resto != parseInt(cpf.charAt(9))) {
                args.IsValid = false;
                return false;
            }

            soma = 0;
            for (i = 0; i < 10; i++) {
                soma += parseInt(cpf.charAt(i)) * (11 - i);
            }
            resto = 11 - (soma % 11);
            if (resto == 10 || resto == 11) {
                resto = 0;
            }

            if (resto != parseInt(cpf.charAt(10))) {
                args.IsValid = false;
                return false;
            }

            return true;
        }

        function remove(str, sub) {
            i = str.indexOf(sub);
            r = "";
            if (i == -1) return str;
            {
                r += str.substring(0, i) + remove(str.substring(i + sub.length), sub);
            }

            return r;
        }


        function mascara(o, f) {
            v_obj = o
            v_fun = f
            setTimeout("execmascara()", 1)
        }

        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }

        function cpf_mask(v) {
            v = v.replace(/\D/g, "")
            v = v.replace(/(\d{3})(\d)/, "$1.$2")
            v = v.replace(/(\d{3})(\d)/, "$1.$2")
            v = v.replace(/(\d{3})(\d)/, "$1-$2")
            return v
        }
    </script>

    <asp:ValidationSummary ValidationGroup="abc" ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <input type="hidden" name="_VIEWSTATE" id="_VIEWSTATE" value="" />

    <asp:Panel ID="panelCadastroCliente" runat="server">
        <div class="container">
            <div class="d-flex flex-row mb-1">
                <span class="title">Cliente</span>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-2">
                    <asp:Label for="txtCpf" CssClass="form-label" runat="server" ValidateRequestMode="Enabled">CPF*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox CssClass="form-control" ID="txtCpf" runat="server" onkeypress="javascript: mascara(this, cpf_mask);" MaxLength="14"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="abc" runat="server" ControlToValidate="txtCpf" ErrorMessage="O CPF é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomFieldValidator1" ValidationGroup="abc" ClientValidationFunction="validarCPF" runat="server" ControlToValidate="txtCpf" ErrorMessage="Insira um CPF Válido" ForeColor="Red"></asp:CustomValidator>
                    </div>
                </div>
                <div class="flex-row col-10">
                    <asp:Label for="txtNome" CssClass="form-label" runat="server">Nome*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtNome" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ClientValidationFunction="load" ValidationGroup="abc" runat="server" ControlToValidate="txtNome" ErrorMessage="O nome é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-3">
                    <asp:Label for="txtRg" CssClass="form-label" runat="server">RG*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="number" CssClass="form-control" ID="txtRg" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="abc" runat="server" ControlToValidate="txtRg" ErrorMessage="O RG é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-3">
                    <asp:Label for="txtDataExpedicao" CssClass="form-label" runat="server">Data de Expedição</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="date" CssClass="form-control" ID="txtDataExpedicao" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
                <div class="flex-row col-4">
                    <asp:Label for="txtOrgaoExpedidor" CssClass="form-label" runat="server">Orgão Expedidor</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtOrgaoExpedidor" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="ddlUfExpedicao" CssClass="form-label" runat="server">UF de Expedição</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:DropDownList ID="ddlUfExpedicao" runat="server" DataTextField="Descricao" DataValueField="Id" Height="39px" Width="272px" CssClass="font-size:small form-control ">
                            <asp:ListItem Selected="True">Selecione</asp:ListItem>
                            <asp:ListItem>AC</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>AP</asp:ListItem>
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>BA</asp:ListItem>
                            <asp:ListItem>CE</asp:ListItem>
                            <asp:ListItem>DF</asp:ListItem>
                            <asp:ListItem>GO</asp:ListItem>
                            <asp:ListItem>MA</asp:ListItem>
                            <asp:ListItem>MT</asp:ListItem>
                            <asp:ListItem>MS</asp:ListItem>
                            <asp:ListItem>MG</asp:ListItem>
                            <asp:ListItem>PA</asp:ListItem>
                            <asp:ListItem>PB</asp:ListItem>
                            <asp:ListItem>PE</asp:ListItem>
                            <asp:ListItem>PI</asp:ListItem>
                            <asp:ListItem>RJ</asp:ListItem>
                            <asp:ListItem>RN</asp:ListItem>
                            <asp:ListItem>RS</asp:ListItem>
                            <asp:ListItem>RO</asp:ListItem>
                            <asp:ListItem>RR</asp:ListItem>
                            <asp:ListItem>SC</asp:ListItem>
                            <asp:ListItem>SP</asp:ListItem>
                            <asp:ListItem>SE</asp:ListItem>
                            <asp:ListItem>TO</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-3">
                    <asp:Label for="txtDataNascimento" CssClass="form-label" runat="server">Data Nascimento*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="date" CssClass="form-control" ID="txtDataNascimento" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="abc" runat="server" ControlToValidate="txtDataNascimento" ErrorMessage="A data de nascimento é obrigatória" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-3">
                    <asp:Label for="ddlSexo" CssClass="form-label" runat="server">Sexo*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:DropDownList ID="ddlSexo" CssClass="font-size:small form-control " runat="server">
                            <asp:ListItem Selected="True">Selecione</asp:ListItem>
                            <asp:ListItem>Masculino</asp:ListItem>
                            <asp:ListItem>Feminino</asp:ListItem>
                            <asp:ListItem>Indefinido</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="abc" runat="server" ControlToValidate="ddlSexo" ErrorMessage="O campo sexo é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-3">
                    <asp:Label for="ddlEstadoCivil" CssClass="form-label" runat="server">Estado Civil*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:DropDownList ID="ddlEstadoCivil" runat="server" DataTextField="Descricao" DataValueField="Id" Height="39px" Width="272px" CssClass="font-size:small form-control ">
                            <asp:ListItem Selected="True">Selecione</asp:ListItem>
                            <asp:ListItem>Casado(a)</asp:ListItem>
                            <asp:ListItem>Solteiro(a)</asp:ListItem>
                            <asp:ListItem>Viúvo(a)</asp:ListItem>
                            <asp:ListItem>Divorciado(a)</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="abc" runat="server" ControlToValidate="ddlEstadoCivil" ErrorMessage="O estado cívil é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mb-1">
                <span class="title">Endereço</span>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-2">
                    <asp:Label for="txtCep" CssClass="form-label" runat="server">CEP*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="number" CssClass="form-control" ID="txtCep" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="abc" runat="server" ControlToValidate="txtCep" ErrorMessage="O CEP é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtRua" CssClass="form-label" runat="server">Rua*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtRua" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="abc" runat="server" ControlToValidate="txtRua" ErrorMessage="A rua é obrigatória" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-1">
                    <asp:Label for="txtNumero" CssClass="form-label" runat="server">Número*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="number" CssClass="form-control" ID="txtNumero" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="abc" runat="server" ControlToValidate="txtNumero" ErrorMessage="O número é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtComplemento" CssClass="form-label" runat="server">Complemento*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtComplemento" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="abc" runat="server" ControlToValidate="txtComplemento" ErrorMessage="O complemento é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtBairro" CssClass="form-label" runat="server">Bairro*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtBairro" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="abc" runat="server" ControlToValidate="txtBairro" ErrorMessage="O Bairro é obrigatório" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtCidade" CssClass="form-label" runat="server">Cidade*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtCidade" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="abc" runat="server" ControlToValidate="txtCidade" ErrorMessage="A cidade é obrigatória" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="flex-row col-1">
                    <asp:Label for="ddlUfEstado" CssClass="form-label" runat="server">UF*</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:DropDownList ID="ddlUfEstado" runat="server" DataTextField="Descricao" DataValueField="Id" Height="39px" Width="272px" CssClass="font-size:small form-control ">
                            <asp:ListItem Selected="True">Selecione</asp:ListItem>
                            <asp:ListItem>AC</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>AP</asp:ListItem>
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>BA</asp:ListItem>
                            <asp:ListItem>CE</asp:ListItem>
                            <asp:ListItem>DF</asp:ListItem>
                            <asp:ListItem>GO</asp:ListItem>
                            <asp:ListItem>MA</asp:ListItem>
                            <asp:ListItem>MT</asp:ListItem>
                            <asp:ListItem>MS</asp:ListItem>
                            <asp:ListItem>MG</asp:ListItem>
                            <asp:ListItem>PA</asp:ListItem>
                            <asp:ListItem>PB</asp:ListItem>
                            <asp:ListItem>PE</asp:ListItem>
                            <asp:ListItem>PI</asp:ListItem>
                            <asp:ListItem>RJ</asp:ListItem>
                            <asp:ListItem>RN</asp:ListItem>
                            <asp:ListItem>RS</asp:ListItem>
                            <asp:ListItem>RO</asp:ListItem>
                            <asp:ListItem>RR</asp:ListItem>
                            <asp:ListItem>SC</asp:ListItem>
                            <asp:ListItem>SP</asp:ListItem>
                            <asp:ListItem>SE</asp:ListItem>
                            <asp:ListItem>TO</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="abc" runat="server" ControlToValidate="ddlUfEstado" ErrorMessage="A UF é obrigatória" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-grid gap-2 col-2 mx-auto">
            <asp:Button type="button" ValidationGroup="abc" class="btn btn-success" ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
        </div>
        <br />
        <br />


        <div class="row">
            <asp:GridView ID="gdvClientes" runat="server" AutoGenerateColumns="False" Height="105px" Width="1136px" OnRowCommand="gdvClientes_RowCommand1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" />
                    <asp:BoundField DataField="Cpf" HeaderText="Cpf" />
                    <asp:BoundField DataField="Rg" HeaderText="Rg" />
                    <asp:BoundField DataField="DataExpedicao" HeaderText="OrgaoExpedicao" />
                    <asp:BoundField DataField="DataNascimento" HeaderText="DataNascimento" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Sexo" HeaderText="Sexo" />
                    <asp:BoundField DataField="EstadoCivil" HeaderText="EstadoCivil" />
                    <asp:BoundField DataField="UfExpedicao" HeaderText="UF" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CommandName="Editar" CommandArgument='<% #Eval("Id")%>'>Editar</asp:LinkButton>
                            &nbsp;
                                         <asp:LinkButton ID="lnkExcluir" runat="server" CommandName="Excluir" OnClientClick="return confirm('Deseja Realmente Escluir o Cliente')"
                                             CommandArgument='<% #Eval("Id")%>'>Excluir</asp:LinkButton>
                            &nbsp;
                            &nbsp;
                        <asp:LinkButton ID="lnkDetalhes" runat="server" CommandArgument='<% #Eval("Id")%>' CommandName="Detalhes">Detalhes</asp:LinkButton>
                            &nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </asp:Panel>


    <asp:Panel ID="panelDetalhes" runat="server" Visible="False">


        <input type="hidden" name="_VIEWSTATE" id="_VIEWSTATE_Detalhes" value="" />

        <div class="container">
            <div class="d-flex flex-row mb-1">
                <span class="title">Cliente</span>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-2">
                    <asp:Label for="txtCpf" CssClass="form-label" runat="server" ValidateRequestMode="Enabled">CPF</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox CssClass="form-control" ID="txtCpfDetalhes" runat="server" MaxLength="14"></asp:TextBox>
                    </div>
                </div>
                <div class="flex-row col-10">
                    <asp:Label for="txtNome" CssClass="form-label" runat="server">Nome</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtNomeDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-3">
                    <asp:Label for="txtRg" CssClass="form-label" runat="server">RG</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtRgDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-3">
                    <asp:Label for="txtDataExpedicao" CssClass="form-label" runat="server">Data de Expedição</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtDataExpedicaoDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
                <div class="flex-row col-4">
                    <asp:Label for="txtOrgaoExpedidor" CssClass="form-label" runat="server">Orgão Expedidor</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtOrgaoExpedidorDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="ddlUfExpedicao" CssClass="form-label" runat="server">UF de Expedição</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtUfExpedidorDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-3">
                    <asp:Label for="txtDataNascimento" CssClass="form-label" runat="server">Data Nascimento</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtDataNascimentoDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-3">
                    <asp:Label for="ddlSexo" CssClass="form-label" runat="server">Sexo</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtSexoDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>
                    </div>
                </div>
                <div class="flex-row col-3">
                    <asp:Label for="ddlEstadoCivil" CssClass="form-label" runat="server">Estado Civil</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtEstadoCivilDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mb-1">
                <span class="title">Endereço</span>
            </div>
            <div class="d-flex flex-row mb-1">
                <div class="flex-row col-2">
                    <asp:Label for="txtCep" CssClass="form-label" runat="server">CEP</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="number" CssClass="form-control" ID="txtCepDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtRua" CssClass="form-label" runat="server">Rua</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtRuaDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-1">
                    <asp:Label for="txtNumero" CssClass="form-label" runat="server">Número</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="number" CssClass="form-control" ID="txtNumeroDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtComplemento" CssClass="form-label" runat="server">Complemento</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtComplementoDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtBairro" CssClass="form-label" runat="server">Bairro</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtBairroDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-2">
                    <asp:Label for="txtCidade" CssClass="form-label" runat="server">Cidade</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtCidadeDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
                <div class="flex-row col-1">
                    <asp:Label for="ddlUfEstado" CssClass="form-label" runat="server">UF</asp:Label>
                    <div class="input-group mb-1 p-1">
                        <asp:TextBox type="text" CssClass="form-control" ID="txtUfDetalhes" runat="server" aria-describedby="basic-addon3"></asp:TextBox>

                    </div>
                </div>
            </div>
        </div>
        <div class="d-grid gap-2 col-2 mx-auto">
            <asp:Button type="button" ValidationGroup="abc" class="btn btn-success" ID="btnSalvarAlteracao" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
        </div>
        <br />
        <br />
        <div class="d-grid gap-2 col-2 mx-auto">
            <asp:Button Text="Voltar" CssClass="btn btn-dark" ID="txtVoltar" runat="server" OnClick="txtVoltar_Click" />
        </div>

    </asp:Panel>

</asp:Content>

