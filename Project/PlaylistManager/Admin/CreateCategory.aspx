<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PlaylistManagerMaster.Master" AutoEventWireup="true" CodeBehind="CreateCategory.aspx.cs" Inherits="PlaylistManager.Admin.CreateCategory" %>

<%@ MasterType VirtualPath="~/MasterPages/PlaylistManagerMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="server">
    <div class="form-group">
        <asp:TextBox Width="10%" class="form-control" ID="NameTextBox" placeholder="Name" runat="server"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Button OnClick="AddButton_Click" ID="AddButton" runat="server" Text="Add" />
    </div>

    <div style="width: 30%">

        <asp:GridView AllowPaging="true" PageSize="5" OnPageIndexChanging="CategoryGridView_PageIndexChanging" AutoGenerateColumns="false" ItemType="Models.Category" class="table table-bordered table-condensed table-responsive table-hover" ID="CategoryGridView" runat="server">
            
            <Columns>
                <asp:BoundField DataField="CategoryId" HeaderText="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:TemplateField HeaderText="Count of playlists">
                    <ItemTemplate>
                        <p><%# CategoryService.CountOfPlaylistsWithCategory(Item) %></p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
