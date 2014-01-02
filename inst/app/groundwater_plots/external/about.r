function(){
	tabPanel("About",
		p(style="text-align:justify",'This web application displays daily precipitation data for locations throughout the United States.
		The main panel in the graphic shows a time series for each year, where circles indicate daily precipitation frequency and circle size and color indicate relative intensity.
		To the right, opposing bars indicate six-month total precipitation prior to and following the first of the month on which the precipitation years are centered.
		Aggregate summaries appear above both of these panel graphics, where the top left scatterplot and loess smoothing curve represent the average of daily obserrvations across the selected years.
		To the right, the two bars also represent averages of the selected years. In both cases, the averages exclude data from the first and/or last year if either year is incomplete.'),
		p(style="text-align:justify",'I plan to add more geographic locations, and possibly more variables, to this app when time permits.'),
		p(style="text-align:justify",'Data are from',a("Applied Climate Information Systems", href="http://rcc-acis.unl.edu/", target="_blank"),'.'),
		p(style="text-align:justify","Inspiration for the plot format came from Stephen Von Worley's",a("Is California heading into a drought?", href="http://www.datapointed.net/2012/02/san-francisco-rain-year-before-after-valentines-day/", target="_blank"),'graphic.'),
		br(),

		HTML('<div style="clear: left;"><img src="http://www.gravatar.com/avatar/52c27b8719a7543b4b343775183122ea.png" alt="" style="float: left; margin-right:5px" /></div>'),
		strong('Author'),
		p('Matthew Leonawicz',br(),
			'Statistician | useR',br(),
			a('Scenarios Network for Alaska and Arctic Planning', href="http://www.snap.uaf.edu/", target="_blank"),
			'|',
			a('Blog', href="http://blog.snap.uaf.edu/", target="_blank"),
			'|',
			a('Twitter', href="https://twitter.com/leonawicz/", target="_blank"),
			'|',
			a('LinkedIn', href="http://www.linkedin.com/in/leonawicz/", target="_blank")	
		),
		br(),
		
		div(class="row-fluid",
			div(class="span4",strong('Related apps'),
				p(HTML('<ul>'),
					HTML('<li>'),a("Coastal Alaska extreme temperature and wind events", href="http://shiny.snap.uaf.edu/temp_wind_events/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Sea ice concentration and extreme wind events in the arctic", href="http://shiny.snap.uaf.edu/sea_ice_winds/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Arctic sea ice extents and concentrations", href="http://shiny.snap.uaf.edu/sea_ice_coverage/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Alaska climate data EDA", href="http://shiny.snap.uaf.edu/ak_station_cru_eda/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Alaska/western Canada communities and climate", href="http://shiny.snap.uaf.edu/akcan_climate/", target="_blank"),HTML('</li>'),
				HTML('</ul>')),
				strong('Code'),
				p('Source code available at',
				a('GitHub', href="https://github.com/ua-snap/shiny-apps/tree/master/ak_daily_precipitation/", target="_blank")),
				br()
			),
			div(class="span4", strong('Related blog posts'),
				p(HTML('<ul>'),
					HTML('<li>'),a("Alaska communities daily precipitation charts", href="http://blog.snap.uaf.edu/2013/09/17/customizable-charts-with-r-base-graphics-and-shiny/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Coastal Alaska extreme temperature and wind events", href="http://blog.snap.uaf.edu/2013/05/20/r-shiny-web-app-extreme-events/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Sea ice concentration and extreme wind events in the arctic", href="http://blog.snap.uaf.edu/2013/09/09/r-shiny-app-arctic-sea-ice-concentration-and-extreme-winds/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Arctic sea ice extents and concentrations", href="http://blog.snap.uaf.edu/2013/05/20/r-shiny-web-app-sea-ice/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Alaska climate data EDA", href="http://blog.snap.uaf.edu/2013/05/20/r-shiny-web-app-alaska-climate-data-eda/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a("Alaska/western Canada communities and climate", href="http://blog.snap.uaf.edu/2013/07/16/r-shiny-app-alaskawestern-canada-communities-and-climate/", target="_blank"),HTML('</li>'),
					
				HTML('</ul>')),
				br()
			),
			div(class="span4",
				strong('References'),
				p(HTML('<ul>'),
					HTML('<li>'),a('Coded in R', href="http://www.r-project.org/", target="_blank"),HTML('</li>'),
					HTML('<li>'),a('Built with the Shiny package', href="http://www.rstudio.com/shiny/", target="_blank"),HTML('</li>'),
					HTML('<li>'),"Additional supporting R packages",HTML('</li>'),
					HTML('<ul>'),
						HTML('<li>'),a('grid', href="http://cran.r-project.org/web/packages/grid/index.html", target="_blank"),HTML('</li>'),
						HTML('<li>'),a('png', href="http://cran.r-project.org/web/packages/png/index.html", target="_blank"),HTML('</li>'),
					HTML('<ul>'),
				HTML('</ul>'))
			)
		)
	)
}
