module Nfse
  module Envio
    class Tomador
      include Virtus

      attribute :inscricao_municipal, String
      attribute :cnpj, String
      attribute :razao_social, String
      attribute :doc_estrangeiro, String
      attribute :tipo_logradouro, String
      attribute :logradouro, String
      attribute :num_endereco, String
      attribute :complemento_endereco, String
      attribute :tipo_bairro, String
      attribute :bairro, String
      attribute :cod_cidade, String
      attribute :cidade, String
      attribute :cep, String
      attribute :email, String
      attribute :ddd, String
      attribute :telefone, String

      # Rio de janeiro
      attribute :cpf, String
      attribute :uf, String


      attribute :tem_endereco, String, default: :default_tem_endereco
      attribute :tem_contato, String, default: :default_tem_contato

      def default_tem_endereco
        [@logradouro, @num_endereco, @complemento_endereco, @bairro, @cod_cidade, @uf, @cep].uniq != [nil]
      end

      def default_tem_contato
        [@telefone, @email].uniq != [nil]
      end

      def formatted_cnpj
        return cnpj if cnpj == default_cnpj
        cnpj.rjust(14, '0')
      end

      def formatted_cep
        cep.ljust(8, '0') unless cep.nil?
      end

     
    end
  end
end
