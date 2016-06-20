/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package teste;

//import java.util.Scanner;

/**
 *
 * @author 213031161
 */
public class Tabela {
    public static void main(String[] args) {
        //Scanner in = new Scanner(System.in);
        //List<String> clubes = new ArrayList<String>();
        String nomes[] = new String[10];
        //System.out.println("Entre com o nome dos clubes");
        
        
        //carrega do banco os times do grupo
        nomes[0] = "t1";
        nomes[1]=  "t2";
        nomes[2]=  "t3";
        nomes[3]=  "t4";
        nomes[4]=  "t5";
        nomes[5]=  "t6";
        nomes[6]=  "t7";
        nomes[7]=  "t8";
        nomes[8]=  "t9";
        nomes[9]=  "t10";
        
        
        
        String clube = " ";

//        for (int i = 0; i < nomes.length; i++) {
//            //String tec = in.nextLine();
//            //System.out.println(nomes.length);
//            nomes[i] = tec;
//            //System.out.println(nomes.length);
//        }
        
        int vet[] = new int[2];
        
        for (int i = 0; i < vet.length; i++) {
            vet[i] = i+1;
        }

        int t = nomes.length;
        int m = nomes.length / 2;
        for (int i = 0; i < t - 1; i++) {
            System.out.println((i + 1) + "a rodada: ");
            
            for (int j = 0; j < m; j++) {
                //Clube está de fora nessa rodada?              
                if (clube.equals(nomes[j])) {
                    continue;
                }

                //Teste para ajustar o mando de campo
                if (j % 2 == 1 || i % 2 == 1 && j == 0) {
                    System.out.print(nomes[t - j - 1] + " x " + nomes [j]+ "   ");
                    //System.out.print("insercao das paradas PRIM");
                    System.out.println("\tPlacar:   "+vet[0]+ " x "+vet[1]);
                    
                    //System.out.println("\tPlacar: "+nomes[t-j-1]+"XXX"+reportValor()+ "x"+ "XXX"+reportValor()+" "+nomes[j]);
                    
//                    <?php
//			include("conexao.php");
//			$psn = $_SESSION["psn"];
//			$pos = 1;
//			
//			$sql = "insert into partida(id, equipecasa,equipefora,golscasa,golsfora,data,campeonatoID,motm) values (1,nomes[t-j-1], nomes[j], vet[0], vet[1], date, motm)";
//								
//			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
//                        ?>
                    
                } else {
                    System.out.print(nomes[j] + " x " + nomes[t - j - 1] + "   ");
                    //System.out.print("insercao das paradas SEG");
                    System.out.println("\tPlacar:   "+vet[0]+" x "+vet[1]);
//                    <?php
//			include("conexao.php");
//			$psn = $_SESSION["psn"];
//			$pos = 1;
//			
//			$sql = "insert into partida(id, equipecasa,equipefora,golscasa,golsfora,data,campeonatoID,motm) values (1,nomes[t-j-1], nomes[j], vet[0], vet[1], date, motm)";
//								
//			$query = mysqli_query($con,$sql) or trigger_error("Query Failed! SQL: $query - Error: ". mysqli_error($con), E_USER_ERROR);
//                        ?>
//                }
            }
            
            
            //Gira os clubes no sentido horário, mantendo o primeiro no lugar
            //clubes.add(1, clubes.remove(clubes.size() - 1));
        }
       System.out.println("computando resultados");
    }
    } 
}
    
