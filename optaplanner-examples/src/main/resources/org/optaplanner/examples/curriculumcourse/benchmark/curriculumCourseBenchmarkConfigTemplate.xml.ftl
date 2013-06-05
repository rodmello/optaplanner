<?xml version="1.0" encoding="UTF-8"?>
<plannerBenchmark>
  <benchmarkDirectory>local/data/curriculumcourse</benchmarkDirectory>
  <parallelBenchmarkCount>AUTO</parallelBenchmarkCount>
  <warmUpSecondsSpend>30</warmUpSecondsSpend>

  <inheritedSolverBenchmark>
    <problemBenchmarks>
      <xstreamAnnotatedClass>org.optaplanner.examples.curriculumcourse.domain.CourseSchedule</xstreamAnnotatedClass>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp01.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp02.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp03.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp04.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp05.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp06.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp07.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp08.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp09.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp10.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp11.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp12.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp13.xml</inputSolutionFile>
      <inputSolutionFile>data/curriculumcourse/unsolved/comp14.xml</inputSolutionFile>
      <problemStatisticType>BEST_SOLUTION_CHANGED</problemStatisticType>
    </problemBenchmarks>

    <solver>
      <solutionClass>org.optaplanner.examples.curriculumcourse.domain.CourseSchedule</solutionClass>
      <planningEntityClass>org.optaplanner.examples.curriculumcourse.domain.Lecture</planningEntityClass>
      <scoreDirectorFactory>
        <scoreDefinitionType>HARD_SOFT</scoreDefinitionType>
        <scoreDrl>/org/optaplanner/examples/curriculumcourse/solver/curriculumCourseScoreRules.drl</scoreDrl>
      </scoreDirectorFactory>
      <termination>
        <maximumSecondsSpend>300</maximumSecondsSpend>
      </termination>
      <constructionHeuristic>
        <constructionHeuristicType>FIRST_FIT_DECREASING</constructionHeuristicType>
      </constructionHeuristic>
    </solver>
  </inheritedSolverBenchmark>

  <#list [50, 100, 200, 400, 800] as lateAcceptanceSize>
  <solverBenchmark>
    <name>Late Acceptance ${lateAcceptanceSize}</name>
    <solver>
      <localSearch>
        <unionMoveSelector>
          <moveListFactory>
            <cacheType>PHASE</cacheType>
            <selectionOrder>SHUFFLED</selectionOrder>
            <moveListFactoryClass>org.optaplanner.examples.curriculumcourse.solver.move.factory.PeriodChangeMoveFactory</moveListFactoryClass>
          </moveListFactory>
          <moveListFactory>
            <cacheType>PHASE</cacheType>
            <selectionOrder>SHUFFLED</selectionOrder>
            <moveListFactoryClass>org.optaplanner.examples.curriculumcourse.solver.move.factory.RoomChangeMoveFactory</moveListFactoryClass>
          </moveListFactory>
          <moveListFactory>
            <cacheType>PHASE</cacheType>
            <selectionOrder>SHUFFLED</selectionOrder>
            <moveListFactoryClass>org.optaplanner.examples.curriculumcourse.solver.move.factory.LectureSwapMoveFactory</moveListFactoryClass>
          </moveListFactory>
        </unionMoveSelector>
        <acceptor>
          <lateAcceptanceSize>${lateAcceptanceSize}</lateAcceptanceSize>
        </acceptor>
        <forager>
          <acceptedCountLimit>4</acceptedCountLimit>
        </forager>
      </localSearch>
    </solver>
  </solverBenchmark>
  </#list>
  <#list [50, 100, 200, 400, 800] as lateSimulatedAnnealingSize>
  <solverBenchmark>
    <name>Late Simulated Annealing ${lateSimulatedAnnealingSize}</name>
    <solver>
      <localSearch>
        <unionMoveSelector>
          <moveListFactory>
            <cacheType>PHASE</cacheType>
            <selectionOrder>SHUFFLED</selectionOrder>
            <moveListFactoryClass>org.optaplanner.examples.curriculumcourse.solver.move.factory.PeriodChangeMoveFactory</moveListFactoryClass>
          </moveListFactory>
          <moveListFactory>
            <cacheType>PHASE</cacheType>
            <selectionOrder>SHUFFLED</selectionOrder>
            <moveListFactoryClass>org.optaplanner.examples.curriculumcourse.solver.move.factory.RoomChangeMoveFactory</moveListFactoryClass>
          </moveListFactory>
          <moveListFactory>
            <cacheType>PHASE</cacheType>
            <selectionOrder>SHUFFLED</selectionOrder>
            <moveListFactoryClass>org.optaplanner.examples.curriculumcourse.solver.move.factory.LectureSwapMoveFactory</moveListFactoryClass>
          </moveListFactory>
        </unionMoveSelector>
        <acceptor>
          <lateSimulatedAnnealingSize>${lateSimulatedAnnealingSize}</lateSimulatedAnnealingSize>
        </acceptor>
        <forager>
          <acceptedCountLimit>4</acceptedCountLimit>
        </forager>
      </localSearch>
    </solver>
  </solverBenchmark>
  </#list>
</plannerBenchmark>