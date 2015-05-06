module Nfse
  module Envio
    class Tomador
      include Virtus

      attribute :inscricao_municipal, String
      attribute :cnpj, String
      attribute :cnpj_formated, String, default: :format_cnpj
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
      attribute :cep_formated, String, default: :formatted_cep
      attribute :email, String
      attribute :ddd, String
      attribute :telefone, String

      # Rio de janeiro
      attribute :cpf, String
      attribute :cpf_formated, String, default: :format_cpf
      attribute :uf, String


      attribute :tem_endereco, String, default: :default_tem_endereco
      attribute :tem_contato, String, default: :default_tem_contato

      def default_tem_endereco
        [@logradouro, @num_endereco, @complemento_endereco, @bairro, @cod_cidade, @uf, @cep].uniq != [nil]
      end

      def default_tem_contato
        [@telefone, @email].uniq != [nil]
      end

      # def formatted_cnpj
      #   return cnpj if cnpj == default_cnpj
      #   cnpj.rjust(14, '0')
      # end

      def format_cnpj
        formated = cnpj.gsub(/(\.|\-|\/)/, "") if cnpj
        formated
      end

      def format_cpf
        formated = cpf.gsub(/(\.|\-)/, "") if cpf
        formated
      end

      def formatted_cep
        formated = cep.gsub(/(\.|\-|\s)/, "") if cep
        formated
      end

      # def formatted_cep
      #   cep.ljust(8, '0') unless cep.nil?
      # end
    end
  end
end
