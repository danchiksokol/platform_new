<?php

namespace App\Repository;

use Psr\Cache\InvalidArgumentException;
use Symfony\Component\Cache\Adapter\AdapterInterface;

class MemcachedRepository
{
    private AdapterInterface $adapter;

    /**
     * @param AdapterInterface $adapter
     */
    public function __construct(AdapterInterface $adapter)
    {
        $this->adapter = $adapter;
    }

    /**
     * @param string $key
     * @return $this
     * @throws InvalidArgumentException
     */
    public function clearByKey(string $key): static
    {
        $itemCache = $this->adapter->getItem($key);
        if ($itemCache->isHit()) {
            $this->adapter->clear($key);
        }

        return $this;
    }


}