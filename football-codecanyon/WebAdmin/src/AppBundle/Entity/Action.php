<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use MediaBundle\Entity\Media;
/**
 * Action
 *
 * @ORM\Table(name="action_table")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ActionRepository")
 */
class Action
{
   
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    /**
     * @var string
     * @Assert\NotBlank()
     * @Assert\Length(
     *      min = 3,
     *      max = 50,
     * )
     * @ORM\Column(name="title", type="string", length=255))
     */
    private $title;

    /**
     * @var int
     *
     * @ORM\Column(name="position", type="integer")
     */
    private $position;



    /**
     * @Assert\File(mimeTypes={"image/jpeg","image/png" },maxSize="40M")
     */
    private $file;

     /**
     * @ORM\ManyToOne(targetEntity="MediaBundle\Entity\Media")
     * @ORM\JoinColumn(name="media_id", referencedColumnName="id")
     * @ORM\JoinColumn(nullable=false)
     */
    private $media;



    public function __construct()
    {
        $this->channels = new ArrayCollection();
    }
    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set title
     *
     * @param string $title
     * @return Action
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set position
     *
     * @param integer $position
     * @return Action
     */
    public function setPosition($position)
    {
        $this->position = $position;

        return $this;
    }

    /**
     * Get position
     *
     * @return integer 
     */
    public function getPosition()
    {
        return $this->position;
    }

    /**
    * Get Media
    * @return  
    */
    public function getMedia()
    {
        return $this->media;
    }
    
    /**
    * Set Media
    * @return $this
    */
    public function setMedia($media)
    {
        $this->media = $media;
        return $this;
    }

    /**
    * Get file
    * @return  
    */
    public function getFile()
    {
        return $this->file;
    }
    
    /**
    * Set file
    * @return $this
    */
    public function setFile($file)
    {
        $this->file = $file;
        return $this;
    }
    public function __toString(){
        return $this->title;
    }
}
