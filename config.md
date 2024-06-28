+++
# General
author = "Yu-Sheng Zhao and Jin-Guo Liu"

# uncomment and adjust the following line if the expected base URL of your website is something like [www.thebase.com/yourproject/]
# please do read the docs on deployment to avoid common issues: https://franklinjl.org/workflow/deploy/#deploying_your_website

ignore = ["node_modules/", "README.md"]

# RSS stuff
generate_rss = true
website_title = "The Quantum Bay"
website_descr = "Make the quantum bay great!"

prepath = get(ENV, "PREVIEW_FRANKLIN_PREPATH", "") # In the third argument put the prepath you normally use
website_url = get(ENV, "PREVIEW_FRANKLIN_WEBSITE_URL", "www.quantumbay.science") # Just put the website name
rss_full_content = true
rss_file = "post/index"

# Misc
content_tag = ""
+++
