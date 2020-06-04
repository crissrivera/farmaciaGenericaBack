<?php

class clsList
{ 
    private $id;

    function clsList($id)
    {
        $this->id = $id;
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

}