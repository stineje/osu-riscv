It is our hope to add benchmarks that tax RISC-V architectures in this
repository.  We have assembled some links that are helpful; mainly as
a remainder to use where we got things (i.e., to give credit where
credit shoudl be given).  Many of the implementations that are
included so far are programs that we coded up directly instead of
getting from some other location, however, its worth noting sources.


\begin{itemize}
\item \url{http://pages.cs.wisc.edu/~thomas/comp.benchmarks.FAQ.html}
\item R. P. Weicker, "An Overview of Common Benchmarks", IEEE
Computer, pp. 65-75, 1990.
\item \url{https://rosettacode.org}
\end{itemize}

Most of the benchmarks are just tests of certain instructions (e.g.,
add), but there are some true programs that are really meant to task
the architecture to see if things work. The following are
documentation on their operation:
\begin{enumerate}
\item arithtest - just a bunch of R-type instructions all together in
one program to try and tax the instructions for possible errors.  

\item euclid - this is Euclid's algorithm to find the gcd.  There are
two versions.  The first one is a more complex one that has jump and
jal instructions, whereas, the second one does not have this to test
if the algorithm works.

\item fib - This is the ubiquious program to compute the Fibonacci
sequence.  The first program only iterates several times (probably
less than 3), whereas, the second one (i.e., fib2) iterates several
times producing a very  large result.

\item harrisT - these are tests that David Harris wrote for his
Harris/Harris Digital Design and Computer Architecture 2nd edition
text for the MIPS architecture.  The programs were converted to RISC-V
and run to test their operation.

\item mult - this is supposed to be a 32-bit unsigned multiplier
routine written entirely in software.  It produces a 64-bit product.
It seems to work around 97\% of the time, but several times I got
answers that did not seem right.  I was not sure if it was just late
or if I was just not understanding the answer.  Nevertheless, its a
good routine to test computation.

\item sqrt - Another computation-type program that computes the square
root, similar to mult, all in softtware.  This one seems to work well
and produces an answer (as an integer).

\end{enumerate}





