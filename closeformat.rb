
module Jekyll
	module AssetFilter
		def close_format(input)
				emCount = input.scan("<em>").count
				strongCount = input.scan("<strong>").count
				emCCount = input.scan("</em>").count
				strongCCount = input.scan("</strong>").count
				moreEm = emCount - emCCount
				moreStrong = strongCount - strongCCount
				codeCount = input.scan("<code>").count
				codeCCount = input.scan("</code>").count
				moreCode = codeCount - codeCCount

				if moreCode > 0
					moreCode.times {input << "</code>"}
				end
				if moreEm > 0
					moreEm.times { input << "</em>" }
				end
				if moreStrong > 0
					moreStrong.times { input << "</strong>" }
				end

				return input
		end
	end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)