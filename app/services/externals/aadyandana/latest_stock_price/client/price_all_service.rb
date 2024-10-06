module Externals
  module Aadyandana
    module LatestStockPrice
      module Client
        class PriceAllService < DefaultService
          def initialize(params)
            super()

            @params = {
              sort: params[:sort]
            }
          end

          def call
            ::Aadyandana::LatestStockPrice::Client.new(@api_key, @params).price_all
          end
        end
      end
    end
  end
end
