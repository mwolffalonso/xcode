//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Velocidades : Int {
    
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init( velocidadInicial : Velocidades ) {
        self = velocidadInicial
    }
    
    func obtenerVelocidad (velocidad : Int) -> String {
        
        switch self.rawValue {
            
        case Velocidades.Apagado.rawValue:
            return "Apagado"
        case Velocidades.VelocidadBaja.rawValue:
            return "VelocidadBaja"
        case Velocidades.VelocidadMedia.rawValue:
            return "VelocidadMedia"
        case Velocidades.VelocidadAlta.rawValue:
            return "VelocidadAlta"
        default:
            return "Apagado"
        }
    }
    
}

struct Auto {
    
    var velocidad : Velocidades
    
    init( ){
        
        velocidad = Velocidades.Apagado
        
    }
    
    mutating func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String) {
        
        switch velocidad.rawValue {
            
        case Velocidades.Apagado.rawValue:
            velocidad = Velocidades.VelocidadBaja
        case Velocidades.VelocidadBaja.rawValue:
            velocidad = Velocidades.VelocidadMedia
        case Velocidades.VelocidadMedia.rawValue:
            velocidad = Velocidades.VelocidadAlta
        case Velocidades.VelocidadAlta.rawValue:
            velocidad = Velocidades.VelocidadMedia
        default:
            velocidad = Velocidades.VelocidadBaja
        }
        
        return(velocidad.rawValue,velocidad.obtenerVelocidad(velocidad.rawValue))
    }
    
    
}

var auto = Auto()
print("\(auto.velocidad.rawValue),\(auto.velocidad.obtenerVelocidad(auto.velocidad.rawValue))")
var num = 1...20
for i in num {
    let tupla = auto.cambioDeVelocidad()
    print("\(tupla.actual),\(tupla.velocidadEnCadena)")
}
