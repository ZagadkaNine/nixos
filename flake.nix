{
 description = "Nixos config flake";

 inputs = {
   nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
   nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
   home-manager.url = "github:nix-community/home-manager/release-23.11";
 };

 outputs = { 
   self, 
   nixpkgs, 
   nixpkgs-unstable, 
   home-manager,
   ...
 }@inputs: 
 let
   system = "x86_64-linux";
   specialArgs = inputs // { inherit system; };
   shared-modules = [
     home-manager.nixosModules.home-manager
     {
       home-manager = {
         useUserPackages = true;
         extraSpecialArgs = specialArgs;
       };  
     }
   ];
 in {
   nixosConfigurations = {
     nostromo = nixpkgs.lib.nixosSystem {
       specialArgs = specialArgs;
       system = system;
       modules = shared-modules ++ [ ./nostromo.nix ];
     };
     sulaco = nixpkgs.lib.nixosSystem {
       specialArgs = specialArgs;
       system = system;
       modules = shared-modules ++ [ ./sulaco.nix ];
     };
   };
 };
}


