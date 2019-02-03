hw2_sol_check: hw2_sol.Rmd
	cd ./hw2
  Rscript -e 'rmarkdown::render("$<")'
  
clean:
  rm -rf *.html *.md *.docx figure/ cache/