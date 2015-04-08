module Nfse
  module Envio
    class Prestador
      include Virtus

      attribute :inscricao_municipal, String
      attribute :razao_social, String
      attribute :ddd, String
      attribute :telefone, String

      # Rio de janeiro
      attribute :cnpj, String
      attribute :cnpj_formated, String, default: :format_cnpj

      def format_cnpj
        formated = cnpj.gsub(/(\.|\-|\/)/, "") if cnpj
        formated
      end
    end
  end
end
