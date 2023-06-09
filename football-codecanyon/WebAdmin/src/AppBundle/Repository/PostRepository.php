<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * PostRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PostRepository extends EntityRepository
{
		/****
	returns the number of entity's rows
	@return int
	*/
	public function countAll() {
		$query = $this->createQueryBuilder('e')->select('count(e)')->getQuery();
		return $query->getSingleScalarResult();
	}
	public function count($type) {
		$query = $this->createQueryBuilder('e')->select('count(e)')->where("e.type like '".$type."'")->getQuery();
		return $query->getSingleScalarResult();
	}

	public function countShares() {
		$query = $this->createQueryBuilder('e')->select('sum(e.shares)')->getQuery();
		return $query->getSingleScalarResult();
	}
	public function countViews() {
		$query = $this->createQueryBuilder('e')->select('sum(e.views)')->getQuery();
		return $query->getSingleScalarResult();
	}
}
