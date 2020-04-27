require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class get_reporting_resource_information
    def run()

        opts = {}
        opts[:"organization_id"] = "testrest"

        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::ReportDefinitionsApi.new(api_client, config)

        data, status_code, headers = api_instance.get_resource_v2_info(opts)

        return data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        get_reporting_resource_information.new.run()
    end
end
