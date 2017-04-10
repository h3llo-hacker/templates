<?php require_once 'header.php';?>

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
          <h2>XSS 弹弹弹</h2>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <ul>
            <li><a href="example1.php?name=hacker">Example 1</a></li>
          	<li><a href="example2.php?name=hacker">Example 2</a></li>
          	<li><a href="example3.php?name=hacker">Example 3</a></li>
          	<li><a href="example4.php?name=hacker">Example 4</a></li>
          	<li><a href="example5.php?name=hacker">Example 5</a></li>
          </ul>
        </div>

        <div class="span4">
          <ul>
            <li><a href="example6.php?name=hacker">Example 6</a></li>
            <li><a href="example7.php?name=hacker">Example 7</a></li>
            <li><a href="example8.php">Example 8</a></li>
            <li><a href="example9.php#hacker">Example 9</a></li>
          </ul>
        </div>
      </div>

<?php require_once 'footer.php'?>
