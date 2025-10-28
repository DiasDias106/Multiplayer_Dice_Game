import UIKit

class ViewController3: UIViewController {
    
    var pontos:[Int:Int] = [:]
    var jogadores: Int = 1
    
    @IBOutlet weak var lbjogadores: UILabel!
    
    @IBOutlet weak var lbpontos: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storedRondas = UserDefaults.standard.object(forKey: "jogadores") as? Int {
            jogadores = storedRondas
        } else {
            jogadores = 1
        }
        if let pontosArray = UserDefaults.standard.array(forKey: "pontos") as? [[String: Any]] {
            pontos = [:]
            for item in pontosArray {
                if let idString = item["id"] as? String, var id = Int(idString), let valor = item["valor"] as? Int {
                    pontos[id] = valor
                }
            }
        }
        
               var jogadoresText = ""
               var pontosText = ""
               
               for jogador in 1...jogadores {
                   jogadoresText += "Jogador \(jogador)\n"
                   pontosText += "\(pontos[jogador] ?? 0) pontos\n"
               }
               
               lbjogadores.text = jogadoresText
               lbpontos.text = pontosText
        }
            
        }
        
        

