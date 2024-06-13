//
//  File.swift
//  
//
//  Created by Joseph Pereira on 17/05/24.
//

import Foundation

class Galinha: BattleChar {
    
    public enum Ataques{
        case bicar, baterAsa
    }
    
    public func ataques(movimentos: Ataques, BattleChar: BattleChar){
        switch movimentos{
        case .baterAsa:
            BattleChar.modificarCoragem(modificador: -1)
        case .bicar:
            #warning("O warning padrão já diz tudo...")
            // poderia usar o let _ =
            self.ataque(BattleChar: BattleChar)
        }
    }
}
