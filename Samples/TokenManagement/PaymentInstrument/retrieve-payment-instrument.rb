require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class Retrieve_payment_instrument
    def run()
        opts = {}
	opts['profile-id'] = "93B32398-AD51-4CC2-A682-EA3E93614EB1"
        payment_instrument_token_id = "888454C31FB6150CE05340588D0AA9BE"
        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::PaymentInstrumentApi.new(api_client, config)

        data, status_code, headers = api_instance.get_payment_instrument(token_id, opts)

        puts data, status_code, headers
        return data
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        Retrieve_payment_instrument.new.run()
    end
end
