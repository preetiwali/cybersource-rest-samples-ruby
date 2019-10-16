require 'cybersource_rest_client'
require_relative '../../data/Configuration.rb'
require 'csv'

public
class DownloadFileWithFileIdentifier
    def run(file_id)
        download_file_path = "resource//DownloadedFileWithFileID"

        opts = {}
        opts[:"organization_id"] = "testrest"

        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::SecureFileShareApi.new(api_client, config)

        data, status_code, headers = api_instance.get_file(file_id, opts)

        return data, status_code, headers

        # START : FILE DOWNLOAD FUNCTIONALITY
        if data != nil
            file_extension = headers['Content-Type]

            if file_extension.include? "json"
                file_extension = file_extension[-4..file_extension.length]
            else
                file_extension = file_extension[-3..file_extension.length]
            end

            download_file_path = download_file_path + "." + file_extension

            file_handle = File.new(download_file_path, "w")
            file_handle.write(data)
            f.close
            puts "File downloaded at the following location : " + File.expand_path(download_file_path)
        end
        # END : FILE DOWNLOAD FUNCTIONALITY
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        puts "\nInput missing path parameter <fileId>:"
        fileId = gets.chomp

        DownloadFileWithFileIdentifier.new.run(fileId)
    end
end
