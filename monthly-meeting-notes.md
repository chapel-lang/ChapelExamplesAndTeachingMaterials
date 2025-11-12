<!-- this is a template: please do not delete -->
<!-- ### Attendees -->
<!-- ### Agenda -->
<!-- ### Key discussion points -->
<!-- ### Next month -->
<!-- Wishlist of future topics for these meetups. -->

# Wednesday November 12, 2025

### Attendees

* Nelson Dias
* Michelle Strout
* Paul Sathre
* Alex Razoumov

### Agenda

We discussed the future of the [HPC Carpentry Chapel](https://www.hpc-carpentry.org/hpc-chapel) lessons. We
updated them last year, primarily to move to a new template and refresh the examples for Chapel 2.x. However,
the lessons still follow a rather rigid structure centred on traditional parallel programming for physicists
and engineers, i.e. researchers running large numerical simulations.

For context, these lessons were originally designed as part of a two-day workshop: on Day 1, participants
learn about HPC fundamentals -- including schedulers, filesystems, software environments, parallel paradigms,
and best practices -- while on Day 2, the instructor selects a language from
https://www.hpc-carpentry.org/community-lessons for the hands-on programming part.

There was a suggestion to split the main Chapel track into three parts:

1.	A heat solver for engineers and physicists (the current official lessons)
2.	A Julia set example for participants not interested in solving PDEs (which I currently teach)
3.	A third example focusing on task synchronization, with bioinformatics mentioned as a possible theme

Other suggestions:

- Add GPU content and align the numerical example with the rest of the lessons; e.g. I use prime numbers to
  teach GPU programming in Chapel which is not ideal
- Include more introductory, non-HPC material to help promote the language to a broader audience
- Expand the coverage of I/O, including support for different data types and parallel I/O
- Add linear algebra solvers

Couple of limitations to keep in mind:

- These lessons are still part of HPC Carpentry, so they should ideally maintain an HPC focus.
- All lesson updates require reviewer approval. Although I am a maintainer, I can't freely make changes --
  each pull request must be approved by at least one other reviewer before it can be merged. Because of this,
  I maintain my own set of lesson notes ([Parallel programming in Chapel](https://folio.vastcloud.org/chapel)
  and [GPU computing with Chapel](https://folio.vastcloud.org/chapel-gpu)), which have now diverged
  significantly from the official HPC Carpentry version.

### Minutes

Nelson: the suggestion list is very good, meets my own interests; perhaps, there is value in linking the
Carpentry programming examples from the main Chapel language website (Michelle will share this with the Chapel
team). One addition could be serializers and de-serializers which are difficult to follow in the official
Chapel site and docs, so it'd be great to have working examples. Last week was trying to read an HDF4 file
from NASA -- would be great to learn how to read HDF4 in addition to HDF5.

Michelle: wondering if there is a way to crowdsource these Carpentry additions on Chapel Discord. This would
give new users a reason to get excited and contribute. Some time ago Michelle did a blog post with Lydia on
parameter optimization in Chapel https://chapel-lang.org/blog/posts/hpo-example : took a Python code, added
config variables, and then implemented the same problem in a distributed way in Chapel. Another example:
working with the Oak Ridge folks, they had trouble converting files from one format to another. Someone on the
Chapel team wrote a chapel program and scaled it out, now they are able to do their experiments. There are
real practical things that Python people have problems scaling out, so perhaps we could create an HPC
carpentry lesson from existing examples to capture people's attention. Michelle would be happy to post on
Discord about this. The Chapel team is active on several social platforms and GitHub, could have a call on
these. Maybe the easiest way forward would be to create a markdown file: here are some examples in Chapel,
here are some unsolved numerical problems, here are some Python codes to scale out, and we would like to add
these to HPC Carpentry Chapel lessons. (action item below)

Nelson: concrete examples of problems or codes would be very helpful!

Paul: he or Wu Feng might have been the ones who suggested the bioinfo lesson. Talked to his students but did
not get any bites: none wanted to write it in Chapel. Unfortunately, Chapel-related projects are all personal
time, so can't commit a lot of time to this.

Michelle: how much are HPC Carpentry and in particular Chapel lessons are being used for teaching? Are there
any stats? (action item below)

Paul: OpenDwarfs project https://github.com/vtsynergy/OpenDwarfs provides a benchmark suite of different
computational problems (13 HPC dwarfs) -- could be a great opportunity to port these to Chapel! Paul might
start looking into one of those.

Michelle: typically in classes people are strongly discouraged from using AI code generators, as the goal is
to learn coding, but this could be a good oppotunity to use AI to see how far you could go with Chapel on
these examples.

### Action items

1. Alex will email the HPC carpentry steering committee, ask about the training stats, cc Michelle.
2. Alex will start a markdown document with examples in this repository.

### Next meeting

For December, Michelle will ask one of the people on the Chapel team to present on the code they wrote for Oak
Ridge. Michelle will get back to Alex.












# Wednesday October 08, 2025

Cancelled due to ChapelCon this week. Next meeting on Nov-12.

# Wednesday September 10, 2025

### Attendees

* Engin Kayraklioglu
* Michelle Strout
* Nelson Dias
* Paul Sathre
* Daniel Fedorin
* Alex Razoumov

### Agenda

We don't have volunteer speakers so suggesting the following two parts:

1. Alex showed a [couple of side training projects that use
   Chapel](http://folio.vastcloud.org/meetup20250910.html). These sessions are not focused on teaching Chapel
   itself, but rather on providing an opportunity to introduce the audience -- academic researchers from
   diverse fields and our HPC users -- to Chapel while covering other topics.

(1) Developing a 4-hour ML course where the goal is to train a generative AI model on an ensemble of solutions
from a 2D advection solver, and then use the model to predict solutions based on initial conditions. I am
using a Chapel code to generate a large ensemble of solutions for model training.

Nelson: the wave solver run time does not scale linearly with the number of cores. It would be great to have a
few examples online to explain why that happens.

(2) Developing a short course on GPU efficiency for our HPC cluster, which uses NVIDIA H100 cards. These GPUs
can be challenging to utilize effectively: most off-the-shelf software packages achieve well below 75%
utilization. I plan to use a simple Chapel code to demonstrate profiling steps. The challenge is that my
current code is too efficient, maintaining 100% GPU usage. I've manually degraded its efficiency for
demonstration purposes, but I'd prefer to start with a less efficient version and then optimize it.

Engin: the NVIDIA NSight kernel-by-kernel profiler works for Chapel GPU code, but need a special flag to
enable debug symbols and backend optimizations: `--gpu-ptxas-enforce-optimization`. Also the part from our
technote about debugging + profiling with NVIDIA NSight
https://chapel-lang.org/docs/main/technotes/gpu.html#debugger-and-profiler-support-for-nvidia

Engin: can pass a range to the "prime" function, no need for an explicit loop in the main body => better
scheduling on the GPU

2. Other discussion points, time permitting, e.g. showing parallel I/O in teaching, the current state of
   linear algebra in Chapel, and anything else you would like to bring up -- we did not get to these.

### Key discussion points

Discussion on how to better advertise Chapel.

Engin: our top priority is to grow the community, but would special tutorial sessions for the HPC staff help
(in the context of 200 tech staff under the Digital Research Alliance of Canada mostly dismissing Chapel as
being unpopular with users) -- Engin will follow up with Alex

Paul asked for the [link to our EasyBuild recipes for Chapel](https://github.com/ComputeCanada/easybuild-easyconfigs.git)
- anything to reduce the perceived burden for the IT/HPC system maintainers to have it installed systemwide,
  and one less barrier for domain science users
- any existing Spack packages for Chapel?
- also simple Apptainer containers

Michelle: maybe, we should push back on technical talks. The group has been doing this for a while, without
much uptake. Maybe instead we should demo how researchers could use Arkouda to scale things from Python,
i.e. focus on people's needs, as opposed to forcing them to learn Chapel which is a harder sell. Focus on
"here is how you can scale your existing workflow" using high-level libraries like Arkouda.

Nelson: people start learning programming with very simple things, and only later -- once they get used to the
tool -- they step into compute-intensive and parallel topics. Possibly, we could show people that very simple,
non-HPC things can be done easily in Chapel, e.g. associative arrays. Chapel is very easy to learn, and we
should devote time to teaching simple things in Chapel, so that people are drawn to the language for simple
needs. Only later will they use it for compute-intensive problems.

Engin: Re potential false-sharing behavior difference, I don't have a good idea, but just speculating, Chapel
arrays are default-initialized. Moreover, that initialization is done in parallel. Say, you have array of
ints, we'll 0-initialize that memory where each core will initialize its part. That will make better affinity
and your array will be spread across many pages reducing cache conflicts across cores potentially?

### Next month

Our October meeting date falls on ChapelCon'25, and in November coincides with SC, so we might need to
reschedule rather than cancel both.

# Wednesday August 13, 2025

### Attendees

* David Wonnacott
* Engin Kayraklioglu
* Kenjiro Taura
* Alex Razoumov
* arezail
* Iferrant
* Lydia Duncan
* Paul Sathre
* Nelson Dias
* Wu Feng (Virginia Tech)
* Oliver Alvarado Rodriguez

### Agenda

David Wonnacott gave a 20-minute presentation on "Tools for Teaching Intro CS / Programming" ([PDF slides](https://github.com/chapel-lang/ChapelExamplesAndTeachingMaterials/blob/main/Slides/David-Wonnacott-toolsForTeachingComputation.pdf))
- not Chapel-specific; covering the tools he currently uses to teach CS1/CS2, and possible ways to
  "Chapel-ize" them
- focusing on tools like PythonTutor (currently does not support Chapel) and N-Dolphin (notional-machine
  visualizer: this is the code, this is the state, for pure functional programming, could be adapted to
  support Chapel)
- need something that automatically draws diagrams to illustrate execution semantics
- Chapel notebooks would be great!
- Luca pointed out https://marimo.io which stores Python notebooks as native Python code, and tracks variable
  dependencies

Luca Ferranti talked briefly on his work to add Chapel to https://exercism.org as a followup to the [original
ChapelCon'24 presentation](https://chapel-lang.org/ChapelCon24.html#ferranti).
- Exercism is an open-source website to teach programming languages, currently supporting ~70 languages
- makes learning a collaborative community experience: programmers can volunteer as mentors and give feedback
  to people solving exercises; can submit new exercises
- currently stuck at profiling and benchmarking, before the Chapel track can be published

### Key discussion points

Nelson: how can we present Chapel to the general audience? Currently all materials and courses emphasize
parallel features, but Chapel is quite nice even without parallelism. Maybe some effort should go into making
it more popular in general. Someone needs to write a book, perhaps create a website.

Luca: yes, beginners (first-year students) face many challenges with Chapel, starting from not knowing how to
open a terminal, let alone install Chapel.

<!-- with paul S looking at research aspects of Chapel -->

Wu: funding agencies are pulling away from Chapel as it does not take over MPI for parallel
programming. Students/researchers tend to gravitate towards MPI + X since they were exposed to it in
school. It would be nice to push Chapel with less parallelism into undergraduate programs -- this would have a
huge benefit later on in their careers.

Paul: we need to position Chapel as the first language (taught to undergrads). Having easier installers would
reduce the friction. Also improving compile time would help. In general, addressing any friction points and
speeding up compiling and execution would reduce barriers for entry.

arezaii: We did start releasing precompiled binary packages for most distributions, to facilitate the
installation process.

Lydia: the development team continues to work on compilation speeds

Engin: an immediate goal is to use the new compiler frontend into the production

Lydia: there is some internal discussion about interactive shells

arezail: work on Dyno (the internal word for compiler rework) continues, could bring it to an interactive
shell at some point; working on an incremental compiler is further down the line, there are definitely
barriers

arezaii: this template repository https://github.com/chapel-lang/chapel-hello-world will allow the use of
Chapel through GitHub code spaces, which can be connected to via VSCode directly.

Lydia: this accompanying video https://youtu.be/PrB9O_CGV28 shows how to use Chapel through GitHub code
spaces.

<!-- Luca: I wrote an interactive REPL for Chapel ~1 year ago, it was reading hte input, writing the output to a file and printing the diff every time. It was the dumbest code to ever run... but it did run! -->





### Next month

We could do a Q&A session on various topics. Alex could talk about some of the topics we did not have time to cover today.















# Wednesday July 9, 2025

## Agenda

### Attendees

* Michael Ferguson
* Michelle Strout
* Brandon Neth
* Kenjiro Taura
* Nelson da Costa
* Alex Razoumov
* David Wonnacott

### Key discussion points

Brandon N. (General Chair of ChapelCon'25) made a short announcement about submitting to [ChapelCon'25](https://chapel-lang.org/chapelcon25).
- specifically interested in hearing from educators using Chapel in the classroom
- submission deadline July-25
- can specify one of: talk / demo / poster / extended abstract
- length anywhere from 5 to 30 mins

Michael F. talked through the new [Optimization Guide](https://chapel-lang.org/docs/technotes/optimization.html).
- also found under https://chapel-lang.org | Docs | Technical Notes, look for "Optimizing Performance of Chapel Programs"
- justification: here is what we have today in the compiler, here is how you can write a good code with
  today's bottlenecks
- Nelson: how about single-locale performance optimization? e.g. when summing elements of an array with a
  recursive procedure => can slice an array, can go through the binary tree, but end up with tons of slicing,
  any suggestions to optimize?
- Michael: this document mentions overhead of slices being an issue, but emphasise distributed arrays; it is
  an issue in local memory as well, there is some relevant info in the document for non-distributed cases;
  similar problems in the Standard Library for sorting; would be appealing to do with slices, but too much
  overhead; it is possible to reduce slice overheads in the future, but they are definitely here today; see
  the paragraph starting with "One common scenario is that data ..." -- helps in some cases
- David asked about the slice overhead order
- question for the compiler optimization: when wide pointers can be figured out not being remote
- Michael: yes, already doing a number of optimizations for local blocks

Alex R. talked about teaching the revamped Chapel course
- combining data-parallel programming and GPUs , omitting task parallelism
- recently taught it twice: online in May (4 hours, 1 student) and at the SFU Research Computing summer school
  in June (3 hours, 18 students)
- work for the HPC centre; teach ~25 full-day courses on a rotating basis
  - hard to teach Chapel more than ~2X a year, with everything else in the curriculum
  - very few students interested in parallel programming from scratch
- currently teach parallel programming in Chapel, Julia, Python (separate courses)
- all taught to absolute beginners assuming zero programming experience
- Chapel course is preceded by a full-day introduction to HPC: get comfortable with Slurm, talk about shared-
  and distributed-memory programming, briefly go over several parallel programming frameworks including MPI
  and OpenMP
- Part 1 (data parallelism) https://wgpages.netlify.app/chapel
- Part 2 (GPU programming) https://wgpages.netlify.app/chapel-gpu
- ideally 2 full days to cover everything
- consider two problems: embarrassingly parallel (Julia set) and tightly coupled (heat diffusion)
- small training cluster: rely on `sbatch` for all demos and exercises
- QUESTION single-locale data parallelism: any other way to probe the number of tasks?
- with tightly-coupled: only get speedup at sufficiently large problem sizes => takes too long to compute to convergence
  + slow interconnect
  - solutions:
  1. only consider a small number of steps (not iterate until convergence)
  2. replace diffusion with an interesting advection problem
  3. StencilDist? Michael: no need to do copy aggregation with StencilDist (it does it automatically)
  4. any other tightly-coupled problems?
  5. Michelle: consider running a distributed tightly-coupled parallel problem on a single node, with locale
     over-subscription => much faster communication
  6. Michael: could do some optimization in the parallel version with slices
- first taught the GPU part last December: provided both a vGPU (and GPU-enables Chapel) and CPU-as-device
  builds => led to quite a bit of confusion
- in May: prepared only CPU-as-device ... would have been nice to show GPU acceleration!
- in June: tried (and failed) to allocate vGPUs, but had no time to show any GPU demos
- would like to implement the same tightly-coupled problem (as in Part 1) on a GPU
- QUESTION outstanding: plot Julia set on a GPU; now getting a runtime "Error calling CUDA function: an
  illegal memory access was encountered (Code: 700)"; bug in the compiler?

**Question**: do these two snippets always lead to the same behaviour?
```chpl
forall loc in Locales do
  on loc do
	...
```
```chpl
coforall loc in Locales do
  on loc do
	...
```
- Michael: ideally, these two should work the same, but this is *not* what happens now. Let's say we run this
  on 1000 nodes with 16 cores each. Right now `forall` will probe the amount of parallelism on the first node,
  detecting 16 available cores, and will break the problem into 16 parallel tasks. Each task will go in serial
  through its own ~1/16th subset of nodes doing some work there, but the nodes will not be utilized all in
  parallel, i.e. we'll get only 16-way parallelism across nodes. The right solution is to use `coforall`.

**Question**: there is parallel file read example on the front page of https://chapel-lang.org -- can it be
demonstrated that read really happens in parallel for a large file, and how large would that file need to be?
can we determine the number of tasks at runtime?
- Brandon: it'll use whatever the max task parallelism on the node is
- Michael: profiling tools might be able to show the number of tasks. If using `forall`, can use a private
  variable to printout messages from individual tasks or count tasks.

### Next month

- collect topic ideas, suggestions for speakers
- Michelle: Engin might join us; also Ray Tall (?) is planning to teach parallel Chapel in a course, might
  want to share; or we could do a Q&A session on various topics, similar to today's last two questions

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
