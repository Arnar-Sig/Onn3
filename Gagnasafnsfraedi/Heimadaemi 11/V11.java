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
            Statement statement = conn.createStatement();
            statement.execute("DROP TABLE IF EXISTS R");
            statement.execute("DROP INDEX IF EXISTS RINDEX");
            statement.execute("CREATE TABLE R(key INTEGER PRIMARY KEY, value DOUBLE)");
            if(USE_INDEX){
                statement.execute("CREATE INDEX RINDEX ON R (value)");
            }
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO R VALUES (?, ?)");
            long start,end;
            start = System.nanoTime();

            int i;
            for( i=0 ; i!=1000000 ; i++ )
            {
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
            if(USE_INDEX){
                System.out.println("Nidurstada leitar med index: "+r.getInt(1));
                System.out.println("Timi fyrir leit med index: "+
                                    (double)(end-start)/1e9
                                    );
            }
            else{
                System.out.println("Nidurstada leitar an index: "+r.getInt(1));
                System.out.println("Timi fyrir leit an index: "+
                                    (double)(end-start)/1e9
                                    );
            }
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
