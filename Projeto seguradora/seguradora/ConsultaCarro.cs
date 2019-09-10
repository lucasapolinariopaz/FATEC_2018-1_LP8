﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace seguradora
{
	public partial class ConsultaCarro : Form
	{
		int pk_car;

		public ConsultaCarro()
		{
			InitializeComponent();
		}

		private void btn_Sair_Click(object sender, EventArgs e)
		{
			this.Close();
		}

		private void btn_consultaPlaca_Click(object sender, EventArgs e)
		{
			SqlConnection conn = Conexao.obterConexao();
			SqlCommand comm = new SqlCommand("SELECT cli.nome, cli.data_nasc, " +
				"cli.telefone, cli.endereco, car.marca, car.modelo, car.ano_fabricao, " +
				"car.ano_modelo, car.placa, car.cor, car.chassi, car.cod_car FROM " +
				"cliente cli INNER JOIN carro car ON cli.cod_cli = car.cod_cli WHERE " +
				"car.placa = '" + txt_consultaPlaca.Text + "';", conn);
			comm.CommandType = CommandType.Text;
			comm.Parameters.Add(new SqlParameter("@nome", "nome"));
			comm.Parameters.Add(new SqlParameter("@data_nasc", "data_nasc"));
			comm.Parameters.Add(new SqlParameter("@telefone", "telefone"));
			comm.Parameters.Add(new SqlParameter("@endereco", "endereco"));
			comm.Parameters.Add(new SqlParameter("@marca", "marca"));
			comm.Parameters.Add(new SqlParameter("@modelo", "modelo"));
			comm.Parameters.Add(new SqlParameter("@ano_fabricao", "ano_fabricao"));
			comm.Parameters.Add(new SqlParameter("@ano_modelo", "ano_modelo"));
			comm.Parameters.Add(new SqlParameter("@placa", "placa"));
			comm.Parameters.Add(new SqlParameter("@cor", "cor"));
			comm.Parameters.Add(new SqlParameter("@chassi", "chassi_carro"));
			comm.Parameters.Add(new SqlParameter("@cod_car", "cod_car"));

			Conexao.obterConexao();
			DbDataReader dr = comm.ExecuteReader();
			while (dr.Read())
			{
				txt_nomeCliente.Text = dr["nome"].ToString();
				txt_nascCliente.Text = dr["data_nasc"].ToString();
				txt_telefoneCliente.Text = dr["telefone"].ToString();
				txt_enderecoCliente.Text = dr["endereco"].ToString();
				txt_marcaCarro.Text = dr["marca"].ToString();
				txt_modeloCarro.Text = dr["modelo"].ToString();
				txt_anoFabCarro.Text = dr["ano_fabricao"].ToString();
				txt_anoModCarro.Text = dr["ano_modelo"].ToString();
				txt_placaCarro.Text = dr["placa"].ToString();
				txt_corCarro.Text = dr["cor"].ToString();
				txt_chassiCarro.Text = dr["chassi"].ToString();
				pk_car = int.Parse(dr["cod_car"].ToString());
			}
			Conexao.fecharConexao();
		}

		private void btn_Alterar_Click(object sender, EventArgs e)
		{
			txt_marcaCarro.Enabled = true;
			txt_modeloCarro.Enabled = true;
			txt_anoFabCarro.Enabled = true;
			txt_anoModCarro.Enabled = true;
			txt_placaCarro.Enabled = true;
			txt_corCarro.Enabled = true;
			txt_chassiCarro.Enabled = true;
			btn_Salvar.Enabled = true;
		}

		private void btn_Salvar_Click(object sender, EventArgs e)
		{
			string sql = "UPDATE carro SET marca = @marca, modelo = @modelo, " +
				"ano_fabricao = @ano_fabricao, ano_modelo = @ano_modelo, placa = @placa, " +
				"cor = @cor, chassi = @chassi WHERE cod_car = @cod_car";
			SqlConnection conn = Conexao.obterConexao();
			SqlCommand comm = new SqlCommand(sql, conn);
			comm.Parameters.Add(new SqlParameter("@marca", txt_marcaCarro.Text));
			comm.Parameters.Add(new SqlParameter("@modelo", txt_modeloCarro.Text));
			comm.Parameters.Add(new SqlParameter("@ano_fabricao", int.Parse(txt_anoFabCarro.Text)));
			comm.Parameters.Add(new SqlParameter("@ano_modelo", int.Parse(txt_anoModCarro.Text)));
			comm.Parameters.Add(new SqlParameter("@placa", txt_placaCarro.Text));
			comm.Parameters.Add(new SqlParameter("@cor", txt_corCarro.Text));
			comm.Parameters.Add(new SqlParameter("@chassi", txt_chassiCarro.Text));
            comm.Parameters.Add(new SqlParameter("@cod_car", int.Parse(txtcodcar.Text)));  
            comm.CommandType = CommandType.Text;
			Conexao.obterConexao();
			try
			{
				int i = comm.ExecuteNonQuery();
				if (i > 0)
					MessageBox.Show("Registro atualizado com sucesso!");
			}
			catch (Exception ex)
			{
				MessageBox.Show("Erro: " + ex.ToString());
			}
			finally
			{
				Conexao.fecharConexao();
			}
		}

        private void btn_Cancelar_Click(object sender, EventArgs e)
        {

        }
    }
}