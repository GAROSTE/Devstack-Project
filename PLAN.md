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

## **<u>3.*Déploiement du cloud Openstack*</u>**

Afin de déployer notre cloud Openstack nous utiliserons Devstack. En effet Devstack est une série de scripts facilitant le déploiement d'un Openstack avec les modules dont nous avons besoin. Nous pouvons ensuite installer des modules un peu plus avancés.



## **<u>4.*Déploiement de notre infrastructure via Terraform*</u>**

Une fois notre cloud déployé, nous devons maintenant mettre en place l'infrastructure. Le but final ici, sera donc de déployer l'infrastructure via de "l'infrastructure as code" avec notamment Terraform. Cette étape permettra d'automatiser la création de ressources (VMs, BDD etc) afin de faciliter la mise en place de notre infrastructure dans Openstack.





