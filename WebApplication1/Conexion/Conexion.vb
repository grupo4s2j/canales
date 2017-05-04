Imports System.Data.SqlClient
Public Class Conexion
    Public conStr As String = "Data Source=testsalesians.database.windows.net;Database=Test;User ID=Telegram; Password=12Three45678; "
    Public cn As SqlConnection


    Public Sub Abrir()
        Try
            cn = New SqlConnection(conStr)
            cn.Open()
        Catch ex As Exception
            MsgBox("Ha habido un problema de conexión. Pongase en contacto con el Administrador")
        End Try
    End Sub

    Public Sub Cerrar()
        Try
            cn.Close()
        Catch ex As Exception
            'MsgBox("Ha habido un problema de conexión. Pongase en contacto con el Administrador")
        End Try
    End Sub
    Public Sub doQuery(sql As String)
        Abrir()
        Try

            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = sql
            cmd.Connection = cn


            cmd.ExecuteNonQuery()

        Catch ex As Exception
            MsgBox("Ha habido un problema de conexión. Pongase en contacto con el Administrador" + ex.ToString())
        End Try
        Cerrar()
    End Sub
    Public Function doSelect(sql As String) As SqlDataReader
        Abrir()
        Dim lrd As SqlDataReader
        Try

            Dim cmd As New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.CommandText = sql
            cmd.Connection = cn


            lrd = cmd.ExecuteReader
            Return lrd

        Catch ex As Exception
            MsgBox("Ha habido un problema de conexión. Pongase en contacto con el Administrador")

        End Try
        Cerrar()
    End Function

    Public Function doTable(sql As String) As DataTable
        Dim table As New DataTable
        Abrir()
        Try
            Dim cmd As New SqlCommand(sql, cn)
            table.Load(cmd.ExecuteReader)
        Catch ex As Exception
            MsgBox("Ha habido un problema de conexión. Pongase en contacto con el Administrador" + ex.ToString())
        End Try
        Cerrar()
        Return table
    End Function

    Public Function doDataSet(sql As String) As DataSet
        Abrir()
        Dim ds As New DataSet
        Try
            Dim cm As New SqlCommand()
            cm.CommandText = sql
            cm.CommandType = CommandType.Text
            cm.Connection = cn

            Dim da As New SqlDataAdapter(cm)

            da.Fill(ds)
        Catch

        End Try
        Cerrar()
        Return ds
    End Function
    Public Function doUpdateDataSet(sql As String, dt As DataSet) As String
        Abrir()
        Dim ds As New DataSet
        Try
            Dim cm As New SqlCommand()
            cm.CommandText = sql
            cm.CommandType = CommandType.Text
            cm.Connection = cn

            Dim da As New SqlDataAdapter(cm)
            Dim construct As New SqlCommandBuilder(da)
            da.Update(dt.Tables(0))


            da.Fill(ds)
        Catch

        End Try
        Cerrar()
        Return vbOK
    End Function
End Class
