<?php
class Pagination {
	public $total = 0;
	public $page = 1;
	public $limit = 20;
	public $num_links = 6;
	public $url = '';

	public function render() {
		$total = $this->total;

		if ($this->page < 1) {
			$page = 1;
		} else {
			$page = $this->page;
		}

		if (!(int)$this->limit) {
			$limit = 10;
		} else {
			$limit = $this->limit;
		}

		$num_links = $this->num_links;
		$num_pages = ceil($total / $limit);

		$this->url = str_replace('%7Bpage%7D', '{page}', $this->url);

		$output = '<ul class="pagination">';

		//if ($page > 1) {
			//$output .= '<li><a href="' . str_replace('{page}', 1, $this->url) . '">' . $this->text_first . '</a></li>';
			//$output .= '<li><a href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a></li>';
		//}

		if ($num_pages > 1) {
			//if ($num_pages <= $num_links) {
				$start = 1;
				$end = $num_pages;
				/*} else {
                    $start = $page - floor($num_links / 2);
                    $end = $page + floor($num_links / 2);

                    if ($start < 1) {
                        $end += abs($start) + 1;
                        $start = 1;
                    }

                    if ($end > $num_pages) {
                        $start -= ($end - $num_pages);
                        $end = $num_pages;
                    }
                } */




			if($num_pages <= $num_links) {
				for ($i = $start; $i <= $end; $i++) {

					if ($page == $i) {
						$output .= '<li class="active"><span>' . $i . '</span></li>';
					} else {
						$output .= '<li><a href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
					}
				}
			}
			else
			{
				//var_dump($num_pages - 3); die();

				if ($page <= 3)
				{
					for ($i = 1; $i <= 4; $i++) {
						if ($page == $i) {
							$output .= '<li class="active"><span>' . $i . '</span></li>';
						} else {
							$output .= '<li><a href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
						}
					}
					$output .= '<li><a>' . "..." . '</a></li>';
					$output .= '<li><a href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $num_pages . '</a></li>';



				}
				else if ($page >= 4 && $page < $num_pages - 2){
					$output .= '<li><a href="' . str_replace('{page}', 1, $this->url) . '">' . 1 . '</a></li>';
					$output .= '<li><a>' . "..." . '</a></li>';
					$output .= '<li><a href="' . str_replace('{page}', $page - 1, $this->url) . '">' . ($page - 1) . '</a></li>';
					$output .= '<li class="active"><span>' . $page . '</span></li>';
					$output .= '<li><a href="' . str_replace('{page}', $page + 1, $this->url) . '">' . ($page + 1) . '</a></li>';
					$output .= '<li><a>' . "..." . '</a></li>';
					$output .= '<li><a href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $num_pages . '</a></li>';
				}
				else if($page >= $num_pages - 2){

					$output .= '<li><a href="' . str_replace('{page}', 1, $this->url) . '">' . 1 . '</a></li>';
					$output .= '<li><a>' . "..." . '</a></li>';
					for ($i = $num_pages - 3; $i <= $num_pages; $i++) {
						if ($page == $i) {
							$output .= '<li class="active"><span>' . $i . '</span></li>';
						} else {
							$output .= '<li><a href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
						}
					}
				}


			}




		/*	}
			else if ($end > $this->max_num_links)
			{
				for ($i = $start; $i < $this->max_num_links; $i++) {
					if ($page == $i) {
						$output .= '<li class="active"><span>' . $i . '</span></li>';
					}
					else
					{
						$output .= '<li><a href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
					}
				}

				$output .= '<li><a>' . "..." . '</a></li>';

				if ($page == $end) {
					$output .= '<li class="active"><span>' . $end . '</span></li>';
				}
				else
				{
					$output .= '<li><a href="' . str_replace('{page}', $end, $this->url) . '">' . $end . '</a></li>';
				}





			} */





		}

		/*if ($page < $num_pages) {
			$output .= '<li><a href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>';
			$output .= '<li><a href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $this->text_last . '</a></li>';
		} */

		$output .= '</ul>';

		if ($num_pages > 1) {
			return $output;
		} else {
			return '';
		}
	}
}

//<?php
//	/*
//		Place code to connect to your DB here.
//	*/
//
//	// How many adjacent pages should be shown on each side?
//	$adjacents = 3;
//
//	/*
//	   First get total number of rows in data table.
//	   If you have a WHERE clause in your query, make sure you mirror it here.
//	*/
//	$query = "SELECT COUNT(*) as num FROM portfolio";
//	$total_pages = mysql_fetch_array(mysql_query($query));
//	$total_pages = $total_pages['num'];
//
//	/* Setup vars for query. */
//	$limit = 2; 								//how many items to show per page
//	if($page)
//		$start = ($page - 1) * $limit; 			//first item to display on this page
//	else
//		$start = 0;								//if no page var is given, set start to 0
//
//	/* Get data. */
//	$query = "SELECT category, uname, title FROM portfolio LIMIT $start, $limit";
//	$portfolio = mysql_query($query);
//
//	/* Setup page vars for display. */
//	if ($page == 0) $page = 1;					//if no page var is given, default to 1.
//	$prev = $page - 1;							//previous page is page - 1
//	$next = $page + 1;							//next page is page + 1
//	$lastpage = ceil($total_pages/$limit);		//lastpage is = total pages / items per page, rounded up.
//	$lpm1 = $lastpage - 1;						//last page minus 1
//
//	/*
//		Now we apply our rules and draw the pagination object.
//		We're actually saving the code to a variable in case we want to draw it more than once.
//	*/
//	$pagination = "";
//	if($lastpage > 1)
//	{
//		$pagination .= "<div class=\"pagination\">";
//		//previous button
//		if ($page > 1)
//			$pagination.= "<a href=\"diggstyle.php?page=$prev\">« previous</a>";
//		else
//			$pagination.= "<span class=\"disabled\">« previous</span>";
//
//		//pages
//		if ($lastpage < 7 + ($adjacents * 2))	//not enough pages to bother breaking it up
//		{
//			for ($counter = 1; $counter <= $lastpage; $counter++)
//			{
//				if ($counter == $page)
//					$pagination.= "<span class=\"current\">$counter</span>";
//				else
//					$pagination.= "<a href=\"diggstyle.php?page=$counter\">$counter</a>";
//			}
//		}
//		elseif($lastpage > 5 + ($adjacents * 2))	//enough pages to hide some
//		{
//			//close to beginning; only hide later pages
//			if($page < 1 + ($adjacents * 2))
//			{
//				for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
//				{
//					if ($counter == $page)
//						$pagination.= "<span class=\"current\">$counter</span>";
//					else
//						$pagination.= "<a href=\"diggstyle.php?page=$counter\">$counter</a>";
//				}
//				$pagination.= "...";
//				$pagination.= "<a href=\"diggstyle.php?page=$lpm1\">$lpm1</a>";
//				$pagination.= "<a href=\"diggstyle.php?page=$lastpage\">$lastpage</a>";
//			}
//			//in middle; hide some front and some back
//			elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
//			{
//				$pagination.= "<a href=\"diggstyle.php?page=1\">1</a>";
//				$pagination.= "<a href=\"diggstyle.php?page=2\">2</a>";
//				$pagination.= "...";
//				for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
//				{
//					if ($counter == $page)
//						$pagination.= "<span class=\"current\">$counter</span>";
//					else
//						$pagination.= "<a href=\"diggstyle.php?page=$counter\">$counter</a>";
//				}
//				$pagination.= "...";
//				$pagination.= "<a href=\"diggstyle.php?page=$lpm1\">$lpm1</a>";
//				$pagination.= "<a href=\"diggstyle.php?page=$lastpage\">$lastpage</a>";
//			}
//			//close to end; only hide early pages
//			else
//			{
//				$pagination.= "<a href=\"diggstyle.php?page=1\">1</a>";
//				$pagination.= "<a href=\"diggstyle.php?page=2\">2</a>";
//				$pagination.= "...";
//				for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
//				{
//					if ($counter == $page)
//						$pagination.= "<span class=\"current\">$counter</span>";
//					else
//						$pagination.= "<a href=\"diggstyle.php?page=$counter\">$counter</a>";
//				}
//			}
//		}
//
//		//next button
//		if ($page < $counter - 1)
//			$pagination.= "<a href=\"diggstyle.php?page=$next\">next »</a>";
//		else
//			$pagination.= "<span class=\"disabled\">next »</span>";
//		$pagination.= "</div>\n";
//	}

