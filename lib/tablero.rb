#require 'Matrix'
class Tablero

    def initialize ()
        @filasTotales=8
        @columnasTotales=8
        @tablero = Matrix.build(8,8) { 0 }
        @minasReales=10
        @minasSupuestas=10
    end
    def menos1MinaSupuesta()
        @minasSupuestas=@minasSupuestas-1
    end
    def getTablero()
        @tablero
    end
    def getMinasSupuestas()
        @minasSupuestas
    end
    def getCasilla(fila, columna)
        @tablero[fila, columna] 
    end
    def insertarMinas()
        @tablero[0,4]=100
        @tablero[1,1]=100 
        @tablero[1,5]=100
        @tablero[2,0]=100
        @tablero[3,0]=100
        @tablero[3,5]=100
        @tablero[4,1]=100
        @tablero[6,7]=100
        @tablero[7,4]=100
        @tablero[7,6]=100
    end
    def getContMinasReales()
        cont = 0
        (0..7).each do |fila|
            (0..7).each do |columna|
                if (@tablero[fila,columna]==100)
                    cont = cont + 1
                end
            end
        end
        cont
    end
    def insertar1Numero(fila,columna)
        numeroMinasAlrededor = 0
        (fila-1..fila+1).each do |filaActual|
            (columna-1..columna+1).each do |columnaActual|
                if filaActual>-1 and filaActual<@filasTotales and columnaActual>-1 and columnaActual<@columnasTotales
                    if @tablero[filaActual,columnaActual] == 100
                        numeroMinasAlrededor= numeroMinasAlrededor + 1
                    end
                end
            end
        end
        @tablero[fila,columna] = numeroMinasAlrededor
    end
    def insertarNumerosEnTablero()
        (0..@filasTotales-1).each do |filaActual|
            (0..@columnasTotales-1).each do |columnaActual|
                if @tablero[filaActual,columnaActual] != 100
                    insertar1Numero(filaActual,columnaActual)
                end
            end
        end
    end
end
