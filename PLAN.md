# Plan d'action



## <u>1.*Choix des composants de notre cloud Openstack*</u>

Le but pour l'instant sera de déployer une infrastructure basique (que l'on a pu tester avec MicroStack) avec les composants de départ : Compute  -> Nova

​				Network -> Neutron

​				Identity (authentification) -> Keystone

​				Image service -> Glance

​				Block Storage -> Cinder

​				Object Storage -> Swift

​				Dashboard -> Horizon



Une fois cette infrastructure en place, nous ajouterons d'autres composants pour une solution un peu plus élaborée.

## <u>2.*Etapes du déploiement*</u>

Certains composants requièrent d'avoir au préalable d'autres composants déjà installés, il faut donc réaliser ces étapes dans le bon ordre.

1/ Installation de Keystone, Glance, Neutron, Placement qui sont les pré-requis à l'installation de Nova. Ces composants requièrent l'installation de bases de données.

2/ Nous installerons ensuite Nova, qui sera le "cœur" de l'infrastructure et qui jouera le rôle de serveur virtuel. 

3/ Horizon, l'interface web est basée sur Django, un framework web sous python qu'il faudra installer au préalable. 

4/ Swift, 





