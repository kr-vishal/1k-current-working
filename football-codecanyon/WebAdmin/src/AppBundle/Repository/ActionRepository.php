<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * ActionRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ActionRepository extends EntityRepository
{
	/****
	returns the number of entity's rows
	@return int
	*/
	public function count() {
		$query = $this->createQueryBuilder('e')->select('count(e)')->getQuery();
		return $query->getSingleScalarResult();
	}
}
