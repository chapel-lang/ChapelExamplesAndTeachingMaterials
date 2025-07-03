# Wednesday July 9, 2025

## Agenda

Alex R. will be presenting a 15-minute talk covering his recent Chapel course (combining data-parallel
programming and GPUs) that was taught twice (online in May and at the SFU Research Computing summer school in
June).

### Attendees
### Key discussion points

# Wednesday May 14, 2025

## agenda
Wednesday May 14th at 9am pacific time, I will be presenting a 25-minute talk titled “MARBLChapel: Fortran-Chapel Interoperability in an Ocean Simulation”.

### Attendees
* Alex R.
* Michael F.
* Paul S.
* Dave W.
* Michelle S.

### Key discussion points

* Alex is teaching a course starting tomorrow and next week about chapel
  * rewrote the course, mostly data parallelism, very little task parallelism
  * part II is GPUs
  * measuring performance in class
  * next month Alex can share it briefly 5 minutes

* Dave had a question, are there libraries for map reduce?
  * Michael, a forall loop is a map, for a reduce can use a reduce intent or a reduce statement
  * Dave, can you hand a function to something for a mapping
  * Michael, needed a custom reduction recently, instead he had a custom type and overload + on it, easiest way to do your own reduction in practice
  * Dave would do map reduce in a parallel programming course

* Michelle gave a talk

* Dave asking about memory safety
  * Michael, [https://chapel-lang.org/blog/posts/memory-safety/](https://chapel-lang.org/blog/posts/memory-safety/)
  * Dave is talking about govt and safety, conflating safety with memory safety, but there are a lot of integer overflow

# Wednesday April 8, 2025


## agenda
We discussed the outline of what Michelle S plans to cover this semester related to Chapel, https://docs.google.com/document/d/1RoUWNRjQURFagg5DVxT4DMnDFVgzLaB0SU_YhOZQdHs/edit?usp=sharing

## Wednesday at 9am pacific / 4pm GMT

### Attendees
* Alex R.
* Michael F.
* Paul S.
* Sosuke H.
* Kenjiro
* Nelson
* Michelle S.

### Key discussion points

* Alex has a class coming up end of May and then a conference after that, 
  will be doing some comparing of programming languages

* talked about a Chapel assignment that does image analysis, [https://github.com/UofA-CSc-372-Spring-2025/CSc372Spring2025-CourseMaterials/blob/main/SmallAssignmentWriteups/sa7-chapel.md](https://github.com/UofA-CSc-372-Spring-2025/CSc372Spring2025-CourseMaterials/blob/main/SmallAssignmentWriteups/sa7-chapel.md)
  * Alex tried to scale the image library 32k^2 image it doesn’t work, 
    no errors doesn’t output anything, 16K^2 worked great

* Info about Image module in Chapel
  * Documentation for the Chapel Image package: [https://chapel-lang.org/docs/main/modules/packages/Image.html](https://chapel-lang.org/docs/main/modules/packages/Image.html)
  * Real world example in Chai: [https://github.com/Iainmon/ChAI/blob/b4df21b3ad4c45ce445842174f5c7270d35819bb/lib/Utilities.chpl](https://github.com/Iainmon/ChAI/blob/b4df21b3ad4c45ce445842174f5c7270d35819bb/lib/Utilities.chpl)
  * Figuring out an image type, [https://github.com/Iainmon/ChAI/blob/b4df21b3ad4c45ce445842174f5c7270d35819bb/lib/Utilities.chpl\#L321](https://github.com/Iainmon/ChAI/blob/b4df21b3ad4c45ce445842174f5c7270d35819bb/lib/Utilities.chpl#L321)
  * Demo of using Image package: [https://www.youtube.com/watch?v=5x3Lsn-yOD0](https://www.youtube.com/watch?v=5x3Lsn-yOD0)
  * Chapel con 24 tutorial session with the Image module: [https://youtu.be/N2LWN3A9rck?si=rC6KOuXgrjJB6p9h&t=765](https://youtu.be/N2LWN3A9rck?si=rC6KOuXgrjJB6p9h&t=765)

* Michael talking about the LSB sorting code
  * [https://github.com/mppf/distributed-lsb](https://github.com/mppf/distributed-lsb)
  * looks like a process per socket does perform better

# Wednesday January 8, 2025


## agenda
We discussed the outline of what Michelle S plans to cover this semester related to Chapel, https://docs.google.com/document/d/1RoUWNRjQURFagg5DVxT4DMnDFVgzLaB0SU_YhOZQdHs/edit?usp=sharing

## Wednesday at 9am pacific / 4pm GMT (Europe-friendly time)

### Attendees
* Alex R.
* David W.
* Michael F.
* Brandon N.
* Maryam D.
* Wu F.
* Yonghong Y.
* Michelle S.

### Key discussion points

* Based on some of my notes and from the more thorough notes Brandon took, here is a summary of what we talked about.

* Basic structure of course
  - how do we evaluate languages as tools to solve problems?
  - emphasizing the reason we use languages is to solve problems/write applications. what features make them especially handy to solve certain problems?
  - example: SML has pattern matching, so students will do lexing/parsing assignment
  - example: prolog space repetition system, or optimization problem
  - thinking about what does chapel do especially well

* There were a lot of great suggestions
  * in Lecture 1 on Chapel
    * Michael, it is important for students to see parallelism improving performance.
    * Dave might be good to have them do at least one performance experiment.
  * more generally related to performance cost models
    * Michael indicated there are a number of things that cause distributed overhead
    * Dave W, suggested talking about the constant of the performance versus asymptotic analysis and performance of algorithms
  * in Lecture 6 where I indicated I might do safety and memory management
    * Dave W bringing up safe C++ proposal, Stroustrup’s promises proposal, some things needed in libraries and when running concurrently
      * Could pair with futures, actors, etc.  deadlock free for example may not compose, when might the system fail
    * Michael comments, Blog post about memory safety is coming in theory
  * 3 and 4 of Chapel Basics Slides
    - n-body computation
      - Michael worried about the parallelizability of this, given that astrophysics uses FFT
      - could parallelize over different configurations (small changes to starting conditions)

- Action items for Michelle
  - talk offline with Michael about whether Chapel is installed at UofA
  - contact UofA HPC center
  - see if someone on the team is willing to demo CommDiagnostics, Arkouda, or the runtime for like 20 minutes
    - Alex wants to hear about CommDiagnostics and Arkouda
    - Maryam would like to hear about the Chapel compiler and runtime, requested this in the past as well


# Wednesday November 13th, 2024

## agenda
Simon Tyler’s colleague Stephen Timcheck will talk about their experiences 
learning and using Chapel. They will talk about a paper we are working on that 
uses Chapel for computing digits of pi.

## Wednesday at 9am pacific / 4pm GMT (Europe-friendly time)

### Attendees
* Stephen T.
* Tyler S.
* Alex R.
* David W.
* Michael F.
* Nelson L.

### Key discussion points

* Stephen has been learning Chapel for six months
* He is working on a generic cluster system
* Calculating the digits of Pi
  * calculating Pi is an emerging benchmark
  * example of arbitrary precision arithmetic
  * computing is limited by the amount of memory available
* using Chudnovsky instead of Gauss-Legendre, since Chudnovsky has divide and conquer parallelism
* Using Chapel's GMP and BigInteger libraries
* GMP isn't parallel within a locale
* Conclusions, copied from Stephen's slides
  * Chudnovsky's Algorithm produces digitigs of pi faster than Gauss-Legendre
  * Chapel's parallel structures made leveraging parallelism easy: a simple 3 line code change
  * The parallel Chudnovsky Algorithm ran up to 5X faster than the serial implementation.
  * Not presented: Extending to multiple locales within a larger system required a 1 line code change

#### Code snippet shared in chat
```
// Block Distribution . . .
const Dist = Block.createDomain(Space);
var S:[Dist] owned subproblem?;
forall i in Dist with (ref S) do {
  var tmp_s:subproblem = S[i]!;
  computeBaseSubproblem(tmp_s);
}
var step = 1;
//The number of levels we need to iterate over (tree height) is log2(N)
for h in 1..log2(N) {
  //We can parallelize the merging of subproblems per level of the tree
  forall i in Dist by (step * 2) with (ref S) do {
  var tmp_s1:subproblem = S[i]!;
  var tmp_s2:subproblem = S[i + step]!;
  mergeSubproblems(tmp_s1, tmp_s2);
  }
  step = step * 2;
}
on Locales[0] {
  // Finish the calculation of pi using S[0]. . .
}
```


## Wednesday 7pm pacific / Thursday 9am GMT+10 (Australia and Asia-friendly time)

Canceled for November and December.


# Wednesday October 10th, 2024

## agenda
  * announcements: put Alex slides in GitHub repository
  * Nelson talking about numerical codes he has written
  * Michelle will be teaching Chapel for 5 weeks of a 
    junior-level PL course in the Spring and welcomes any 
    suggestions
  * what to discuss next month?

## Wednesday at 9am pacific / 4pm GMT (Europe-friendly time)

### Attendees

  * Tyler S
  * Dave W
  * Michael F
  * Bonnie H
  * Nelson
  * Paul S
  * Yonghong Y
  * Wu F
  * Michelle S


### Key discussion points
  * Next month on Nov 13: Tyler S is going to share some of
    his experiences teaching Chapel

  * HPC Carpentry Chapel website is now in the new Carpentries 
    Workbench format [https://www.hpc-carpentry.org/hpc-chapel]
    (https://www.hpc-carpentry.org/hpc-chapel), Introduction to 
    High-Performance Computing in Chapel: Summary and Setup

  * Nelson presented on how he uses Chapel in his graduate Numerical Methods course
    * https://nldias.github.io/teaching.html, in Portuguese
    * Runge Kutta procedure, kinematic wave, diffusion, and 
      Laplace/Poisson, like numerical recipes
    * aims to cover a simple version of Navier Stokes

  * Nelson was asking for a central repository for contributions 
    for common operations
      * Paul S gave a plus 1 to this
      * specific gaps were mean and standard deviation
      * Michael suggested Mason is a possible repository


## Wednesday 7pm pacific / Thursday 9am GMT+10 (Australia and Asia-friendly time)

The later one was canceled.

# Wednesday September 11th, 2024

## agenda
  * brief introductions: name, institution
  * Alex talking about HPC Carpentry entry for Chapel
  * deciding what to talk about next month

## Wednesday at 9am pacific / 4pm GMT (Europe-friendly time)

### Attendees

  * Alex R.
  * Bonnie H.
  * Michelle S.
  * Brandon N.
  * Nelson D.
  * Daniel F.
  * Michael F.
  * Maryam D.
  * Atharva
  * Wu F.
  * Paul S.


### Key discussion points
  * Next month: Nelson is going to talk about numerical algorithms he has
    been implementing in Chapel

  * Alex links about HPC Carpentry entry
    * current old-format website ~[https://www.hpc-carpentry.org/hpc-chapel](https://www.hpc-carpentry.org/hpc-chapel)~
    * its repository [https://github.com/hpc-carpentry/hpc-chapel](https://github.com/hpc-carpentry/hpc-chapel)
    * pull request (converted to the new Carpentries Workbench format) [https://github.com/hpc-carpentry/hpc-chapel/pull/23](https://github.com/hpc-carpentry/hpc-chapel/pull/23)
    * preview of the new format [https://razoumov.github.io/chapel-testing](https://razoumov.github.io/chapel-testing)
    * my own Chapel training website [https://wgpages.netlify.app/chapel](https://wgpages.netlify.app/chapel) with more recent materials, Introduction to High-Performance Computing in Chapel

  * Proposal is to have 3 tracks in HPC Carpentries (Alex notes)
    1. heat propagation solver for engineers and physicists
    2. Julia set for people who aren't interested in solving PDEs, still leading to distributed domains
    3. third good example problem to play with task synchronization without distributed domains/arrays- would like to keep the current examples too- include writing into a PNG (as opposed to NetCDF)- some parallel I/O (had a webinar example with HDF5)

  * Other suggestions for a good third example problem
    * Wu, ODEs are used to analyze and predict occurrences in epidemiology, physiology, and neural networks
    * Bonnie, bioinformatics
    * Paul, Smith-waterman

  * People also brought up wanting to include some material about programming GPUs with Chapel.

  * Talked about other possible distributions
    * [https://chapel-lang.org/blog/series/navier-stokes-in-chapel/](https://chapel-lang.org/blog/series/navier-stokes-in-chapel/) jeremiah's posts that use the Stencil distribution


## Wednesday 7pm pacific / Thursday 9am GMT+10 (Australia and Asia-friendly time)

### Attendees

  * Josh M.
  * Kenjiro T.
  * Michelle S.

### Key discussion points

  * Josh suggested having some GPU examples in the carpentry entry as well
  * some possible GPU examples we discussed were...
    * miniBUDE he wrote in Chapel, this is a molecular dynamics code
    * TeaLeaf that he wrote, which is a 3D PDE
    * Coral Reef image analysis GPU code

  * Kenjiro is going to be teaching a grad parallel course in the Fall and
    might consider covering Chapel some at the end
  
  * Josh was asking whether the HPC carpentry stuff has a mechanism for testing
    things that students program or giving quizzes, does anyone know?

  * we talked about how having things like GPU diagnostics and comm diagnostics
    but with a visual component might help new Chapel programmers understand
    what memory allocations and parallelism is happening



# Wednesday August 14th

## agenda
  * brief introductions: name, institution, what want to get out of meeting with this group
  * show repository for gathering materials: https://github.com/mstrout/ChapelExamplesAndTeachingMaterials
    * open to suggestions on how to organize these in a low overhead fashion, but please send those offline or put them in comments
  * Luca about some of his activities and bringing up HPC carpentries entry
  * what do we want to discuss next month?


## Wednesday at 9am pacific / 4pm GMT (Europe-friendly time)

### Attendees

  * Tyler S.
  * Alex R.
  * Kenjiro T.
  * Dave W.
  * Bonnie H.
  * JD
  * Brad C.
  * Michelle S.
  * Ben M.
  * Brandon N.
  * Luca F.
  * Nelson D.
  * Richard S.

### Key discussion points
  * Next month: Alex is going to talk about the Chapel HPC Carpentry lesson 
  * goals people have for this group
    * would like potential student thesis/capstone projects
    * want to hear other people’s experiences
    * want to give feedback
    * want to learn about how other people are using Chapel in different applications
    * potentially use in an intro CS course to enable teaching the algorithms with as little language overhead as possible
    * will be using it in a couple of classes about metagenomics and plan to provide teaching materials
    * want to remain current on what is going on with Chapel project
    * want to support community
    * see a good future for Chapel
  * Luca showed https://github.com/exercism/chapel
  * Michelle is going to link up with Luca and Alex to discuss next steps with HPC Carpentry entry for Chapel



## Wednesday 7pm pacific / Thursday 9am GMT+10 (Australia and Asia-friendly time)

### Attendees

  * Josh M.
  * Michelle S.

### Key discussion points

  * Need to get Chapel in front of more undergraduates, potentially this group could design an intro to CS course based on Chapel?
  * A 3-hour workshop Josh developed and taught, https://github.com/ANU-HPC/chapelDeviceAgnostic
  * reduce the barrier to entry for someone who just wants to try out Chapel
    * programming models that have gone viral have focused on that initial issue, how to build and install
    * examples are spark and python, if it is easy to learn a little, then folks will stick with it due to the sunk cost fallacy
