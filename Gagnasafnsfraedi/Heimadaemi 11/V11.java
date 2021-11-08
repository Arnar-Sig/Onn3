import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

// Notkun: java -cp .;sqlite-jdbc-....jar V11 <args>
//         þar sem <args> er: [autocommit|noautocommit] [index|noindex]
// Eftir:  Búið er að mæla tíma fyrir gagnagrunnsaðgerðir og
//         skrifa niðurstöður
public class V11
{
    public static void main( String[] args )
        throws Exception
    {
        Class.forName("org.sqlite.JDBC");
        boolean USE_AUTOCOMMIT = args[0].equals("autocommit");
        boolean USE_INDEX = args[1].equals("index");
        Connection conn = null;
        try
        {
            conn = DriverManager.getConnection("jdbc:sqlite:v11.db");
            conn.setAutoCommit(USE_AUTOCOMMIT);
            /* Hér vantar Java forritstexta sem gerir eftirfarandi:
             * 1. Eyðir töflunni R ef hún er til, þ.e. (í SQLite)
             *         DROP TABLE IF EXISTS R
             * 
             * 2. Eyðir vísaskránni RINDEX ef hún er til, þ.e.
             *         DROP INDEX IF EXISTS RINDEX
             * 3. Býr til töflu R sem hefur dálk key af tagi INTEGER
             *    sem skal vera lykill, og dálk value af tagi DOUBLE, þ.e.
             *         CREATE TABLE R( key INTEGER PRIMARY KEY, value DOUBLE )
             * 4. Býr til vísaskrá RINDEX fyrir dálkinn value í R, þ.e.
             *         CREATE INDEX RINDEX ON R(value)
             *    en aðeins ef USE_INDEX er satt.
             * 5. Býr til PreparedStatement pstmt til að setja gildi í R, þ.e.
             *         INSERT INTO R VALUES(?,?)
             */
            Statement statement = conn.createStatement();
            statement.execute("DROP TABLE IF EXISTS R");
            statement.execute("DROP INDEX IF EXISTS RINDEX");
            statement.execute("CREATE TABLE R(key INTEGER PRIMARY KEY, value DOUBLE)");
            if(USE_INDEX){
                statement.execute("CREATE INDEX RINDEX ON R(value)");
            }
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO R VALUES (?, ?)");
            long start,end;
            start = System.nanoTime();

            int i;
            for( i=0 ; i!=1000000 ; i++ )
            {
                /*
                 * Hér vantar Java forritstexta til að bæta við tvennd (i,y)
                 * í R þar sem y skal vera slembitala jafndreifð á bilinu
                 * [0,1[. Kallið Math.random() skilar slíkri tölu.
                 * Notið pstmt til að framkvæma innsetninguna.
                 * Einnig skal fylgjast með tímanum með kalli á
                 * System.nanoTime(). Ef meira en ein mínúta er liðin síðan
                 * lykkjan hófst skal hætta í lykkjunni.
                 *
                 * Takið eftir að ef USE_AUTOCOMMIT er satt þá gerist sjálfkrafa
                 * COMMIT eftir hverja SQL aðgerð í þessari lykkju.
                 */
                if((System.nanoTime()-start)>60000000000L){
                    break;
                }
                Double rand = Math.random();
                pstmt.setInt(1,i);
                pstmt.setDouble(2,rand);
                pstmt.executeUpdate();
            }
            if( !USE_AUTOCOMMIT ) conn.commit();
            
            end = System.nanoTime();
            System.out.println("Timi fyrir "+
                               i+" innsetningar: "+
                               (double)(end-start)/1e9
                              );

            System.out.println("Timi per innsetningu: "+
                               (double)(end-start)/1e9/i
                              );
            
            start = System.nanoTime();
            ResultSet r =
                statement.executeQuery
                    ("SELECT COUNT(*) FROM R WHERE "+
                     "value BETWEEN 0.01 AND 0.10"
                    );
            r.next();
			end = System.nanoTime();
            System.out.println("Nidurstada leitar: "+r.getInt(1));
            System.out.println("Timi fyrir leit: "+
                               (double)(end-start)/1e9
                              );
        }
        catch(SQLException e)
        {
            System.err.println(e.getMessage());
        }
        finally
        {
            try
            {
                if(conn != null) conn.close();
            }
            catch(SQLException e)
            {
                System.err.println(e);
            }
        }
    }
}
