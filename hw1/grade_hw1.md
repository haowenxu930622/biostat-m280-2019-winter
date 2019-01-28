*Haowen Xu*


### Overall Grade: 106/110

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline?  

    Yes. `Jan 24, 2019, 5:26 PM PST`.

-   Is the final report in a human readable format html? 

    Yes. `html`.

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

    Yes. `Rmd`.

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how are results produced by just reading the report? 

	 Yes.

### Correctness and efficiency of solution: 59/60

-   Q1 (10/10)

-   Q2 (20/20)

	
-   Q3 (15/15)

	
-  Q4 (14/15)

	\#3. (-1 pt) Table looks crude. You may add the following lines to the last code chunk in `hw1_sol.Rmd`
	
	````
	library(knitr)
    kable(simulation)
	````
  
    to print the table in the given format.
 
### Usage of Git: 9/10

-   Are branches (`master` and `develop`) correctly set up? Is the hw submission put into the `master` branch?

    Yes.

-   Are there enough commits? Are commit messages clear?  

    19 commits for hw1 in `develop` branch. 
              
-   Is the hw1 submission tagged?  

    Tag name should be `hw1`.

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 

    Yes.
  
-   Do not put a lot auxiliary files into version control. (-1 pt)

	 Exclude files such as `n100dist_gaussian.txt`, `n100dist_t1.txt` from version control as these files should be reproducible from `hw1_sol.Rmd`. 

### Reproducibility: 8/10

-   Are the materials (files and instructions) submitted to the `master` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? (-2 pts)

	Clicking `knit` button does not produce the final html on teaching server. Make sure your collaborators can easily run your code. 
	
	- The path `"/home/haowenxu930622/biostat-m280-2019-winter/hw1/"` in `q4_summary.R` is for your own directory on the server. Use relative path (for example, `"./"`) for easier reproducibility.

	- You need to include 
	
	````
	```{bash}
	curl https://www.gutenberg.org/files/1342/1342.txt > pride_and_prejudice.txt
	```
	````
	for obtaining `pride_and_prejudice.txt`. Include all codes necessary for easier reproducibility.
	
	
-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the ressults?

    Yes.

### R code style: 20/20

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 

-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.).  	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. 
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
