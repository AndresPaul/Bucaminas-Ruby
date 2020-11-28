require "matrix.rb"
require "matrix/eigenvalue_decomposition.rb" 
require "matrix/lup_decomposition.rb"

class Tablero

    def initialize ()
        @filasTotales
        @columnasTotales
        @tablero
        @minas=10
        @banderas=8
    end
    def crearTablero(fila,columna)
        @tablero = Matrix.build(fila,columna) {[0,false]}
        @filasTotales = fila
        @columnasTotales = columna
    end
    def generarHTMLParaCasilla()
        casilla = '<div class="casilla">' + @tablero[1,1][0].to_s + '</div>'
        puts casilla
    end    
    def generarHTMLParaTablero()
        filasDelTablero= @tablero.row_count
        columnasDelTablero = @tablero.column_count
        tablero = ''
        (0..filasDelTablero-1).each do |filaActual|
            (0..columnasDelTablero-1).each do |columnaActual|
                if @tablero[filaActual,columnaActual][1] == false 
                    tablero = tablero + '<div class="casilla">' + @tablero[filaActual,columnaActual][0].to_s + '</div>'
                else
                    tablero = tablero + '<div>' + @tablero[filaActual,columnaActual][0].to_s + '</div>'
                end
            end
        end
        tablero
    end
    def abrirCasilla(fila,columna)
        @tablero[fila,columna][1] = true
        if @tablero[fila,columna][0] == 100
            perderPartida()
        end
    end
    def perderPartida()
        mensaje = 'Perdiste'
    end
    def quitarUnaBandera()
        @banderas=@banderas-1
    end
    def mostrarFilasDeTablero()
        tamañoTablero = @tablero.row_count
    end 
    def mostrarColumnasDelTablero()
        columnasTablero = @tablero.column_count
    end 
    def getTablero()
        @tablero
    end
    def mostrarTablero()
        puts @tablero
    end
    def mostrarBanderas()
        @banderas
    end
    def mostrarUnaCasilla(fila, columna)
        @tablero[fila, columna]
    end
    def insertarMinas(cantidadDeMinas)
    
        (1..cantidadDeMinas).each do |i|
            random1= rand(@filasTotales)
            random2 = rand(@columnasTotales)
            if @tablero[random1,random2][0] != 100
                @tablero[random1,random2][0] = 100
            else    
                i = i - 1
            end
        end
    end
    def contarMinas()
        cont = 0
        (0..7).each do |fila|
            (0..7).each do |columna|
                if (@tablero[fila,columna][0]==100)
                    cont = cont + 1
                end
            end
        end
        cont
    end
    def contarMinasAlrededor(fila,columna)
        numeroMinasAlrededor = 0
        (fila-1..fila+1).each do |filaActual|
            (columna-1..columna+1).each do |columnaActual|
                if filaActual>-1 and filaActual<@filasTotales and columnaActual>-1 and columnaActual<@columnasTotales
                    if @tablero[filaActual,columnaActual][0] == 100
                        numeroMinasAlrededor= numeroMinasAlrededor + 1
                    end
                end
            end
        end
        if numeroMinasAlrededor > 0
            @tablero[fila,columna][0] = numeroMinasAlrededor 
        end
    end
    def insertarNumeroDeMinasAlrededor()
        (0..@filasTotales-1).each do |filaActual|
            (0..@columnasTotales-1).each do |columnaActual|
                if @tablero[filaActual,columnaActual][0] != 100
                    contarMinasAlrededor(filaActual,columnaActual)
                end
            end
        end
    end
end
