
<!DOCTYPE html PUBLIC >

<%


	Sub btnSearch_OnClick(ByVal sender As Object, ByVal e As EventArgs)
        Dim objCommand As OleDbCommand
        Dim objAdapter As OleDbDataAdapter
        Dim objDataSet As DataSet
        Dim strSearch As String


        Dim objConnection As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\wwwroot\ben\app_data\database.mdb"
	Dim cn As New OleDbConnection(objConnection)
        Dim strSQLQuery As String


        strSearch = txtSearch.Text


        If Len(Trim(strSearch)) > 0 Then


            strSQLQuery = "SELECT Omschrijving FROM artikelen_new WHERE Omschrijving LIKE '%" & Replace(strSearch, "'", "''") & "%' ORDER BY Omschrijving;"


	    cn.Open()
            Dim cmd As New OleDbCommand(strSQLQuery, cn)


            objCommand = New OleDbCommand(strSQLQuery, cn)


            objAdapter = New OleDbDataAdapter(objCommand)
            objDataSet = New DataSet()
            objAdapter.Fill(objDataSet)


            dgPaging.DataSource = objDataSet
            dgPaging.DataBind()


            cn.Close()
        Else
            txtSearch.Text = "Geef hier een zoekopdracht in!"
        End If
    End Sub


</script>
<html>
<head>
  <title>Ine's crazy funshop</title>
</head>
<body>


<form runat="server">


<asp:TextBox id="txtSearch" runat="server" Width="200px" />


<asp:Button id="btnSearch" runat="server"
Text    ="Search"
OnClick ="btnSearch_OnClick"
/>


<asp:DataGrid id="dgPaging" runat="server"
HeaderStyle-Font-Bold="True"
/>


</form>


</body>
</html>