hw2_sol_check: ./hw2hw2_sol.Rmd
	Rscript -e 'rmarkdown::render("$<")'
  
clean:
	rm -rf *.html *.md