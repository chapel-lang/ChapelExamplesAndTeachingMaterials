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
