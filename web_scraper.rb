require 'rubygems'
require 'bundler/setup'
require 'mechanize'
require 'csv'

# Instantiate a new Mechanize
scraper = Mechanize.new

scraper.history_added = Proc.new { sleep 0.5 }

# Grab and parse our page in one step
# like we did with Nokogiri and open-uri
page = scraper.get('https://www.dice.com/jobs/advancedResult.html?for_one=Ruby&for_all=&for_exact=&for_none=&for_jt=&for_com=&for_loc=New+York%2C+NY&sort=relevance&limit=50&radius=0')



search_results = page.search('.serp-result-content')
p search_results.count

pp search_results[1].css('h3').text.strip
pp search_results[1].css("[id*='company']").text


# Grab the form of class="f" from the page
# job_div = page.div(:class => "serp-result-content")

# Grab the form by ID or action
# another_form = page.form_with(:id => "some-id")
# another_form = page.form_with(:action => "/some_path")

# # Fill in the field named "q" (Google's search query)
# job_div.q = 'ruby mechanize'

# # Actually submit the form
# page = scraper.submit(job_div)

# # Print out the page using the "pretty print" command
# pp page