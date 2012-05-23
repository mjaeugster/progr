
## Programming R I
   - Basic Programming Stuff
   - Error Handling
     - Debugging
       - browser, debug, undebug
       - options(error = recover)
       - traceback
       - http://cran.r-project.org/doc/manuals/R-exts.html#Debugging
     - Condition handling
       - tryCatch
       - stop, warning, message
   - Profiling
   - Package development
   - Parallel programming


## Programming R II
    98-*.Rnw
   - Computing on the Language
     - Formulas
   - Understanding R Internals
     - How computes R the "mean"?
       - .Internal, .Primitive function table
         - http://svn.r-project.org/R/trunk/src/main/names.c
         - do_summary with op = 1
         - Use, e.g., Google Search with :site to find the corresponding do_... C function
   - Computing on Packages
     - packageDescription, available.packages, etc.
   - Namespace Hacking
     - assignInNamespace

## Appendix
    99-*.Rnw
   1. Coding Conventions
      - The Art of Readable Code
        - http://ofps.oreilly.com/titles/9780596802295/

