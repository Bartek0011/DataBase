import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Set;
import javax.swing.*;

public class Window extends JFrame implements ActionListener{
	static Window www = new Window();
	static DB db = new DB();
	
	
	JTextField gen = new JTextField("Firma");
	JTextField gena = new JTextField("Imi�");
	JTextField genb = new JTextField("Nazwisko");
	JTextField genc = new JTextField("Miasto");
	JTextField gend = new JTextField("Ulica");
	JTextField gene = new JTextField("telefon");
	JTextField genf = new JTextField("NazwaFirmy");
	JButton buttonf = new JButton("Firmy");
	JButton buttonp = new JButton("Pracownicy");
	JButton buttond = new JButton("Dyrektorzy");
	JButton buttonw = new JButton("W�a�ciciele");
	JButton buttonww = new JButton("Wydzia�y");
	JButton buttondodaj = new JButton("Dodaj");
	JButton buttonusun = new JButton("Usu�");
	
	JLabel lab = new JLabel();
    
	public void Win(){
		setSize(710,650);
		setLocationRelativeTo(null);
	    setLayout(null);
	    setResizable(false);
	    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    
	    
	      
	    lab.setBounds(20,100, 100,50);
	    
	    gen.setBounds(5, 20, 95, 50);
	    gena.setBounds(350, 100, 95, 50);
	    genb.setBounds(350, 150, 95, 50);
	    genc.setBounds(350, 200, 95, 50);
	    gend.setBounds(350, 250, 95, 50);
	    gene.setBounds(350, 300, 95, 50);
	    genf.setBounds(350, 350, 95, 50);
	    buttonf.setBounds(100, 20,120,50);
	    buttonf.addActionListener(this);
	    buttonp.setBounds(220, 20,120,50);
	    buttonp.addActionListener(this);
	    buttond.setBounds(340,20,120,50);
	    buttond.addActionListener(this);
	    buttonw.setBounds(460, 20,120,50);
	    buttonw.addActionListener(this);
	    buttonww.setBounds(580, 20,120,50);
	    buttonww.addActionListener(this);
	    buttondodaj.setBounds(450, 100,120,50);
	    buttondodaj.addActionListener(this);
	    buttonusun.setBounds(555, 100,120,50);
	    
	    
	    add(gen);
	    add(gena);
	    add(genb);
	    add(genc);
	    add(gend);
	    add(gene);
	    add(genf);
	    add(buttonf);
	    add(buttonp);
	    add(buttond);
	    add(buttonw);
	    add(buttonww);
	    add(buttondodaj);
	    
	    add(lab);
	    
	    setVisible(true);
	}
	/*
	public void setA(String aa){
		JLabel lab = new JLabel(aa);
		lab.setBounds(20,100, 100,50);
		add(lab);
		
	}
	*/

	public void actionPerformed(ActionEvent e) {
		Object source = e.getSource();
		String[] stri = new String[10];
		String strin ="";
		if(source==buttonf){
			
			stri=db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 1, "", "", "", "", "", "");
			
			lab.setText("AA");
			
			/*
			strin=stri[0];
			strin+=" ";
			strin+=stri[1];
			System.out.println(strin);
			www.setA(strin);
			*/
		    
		}
		if(source==buttonp){
			String a=gen.getText();
			db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 2, a, "", "", "", "", "");	
		}
		if(source==buttond){
			String a=gen.getText();
			db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 3, a, "", "", "", "", "");	
		}
		if(source==buttonw){
			String a=gen.getText();
			db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 4, a, "", "", "", "", "");	
		}
		if(source==buttonww){
			String a=gen.getText();
			db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 5, a, "", "", "", "", "");	
		}
		if(source==buttondodaj){
			String aa=gena.getText();
			String bb=genb.getText();
			String cc=genc.getText();
			String dd=gend.getText();
			String ee=gene.getText();
			String ff=genf.getText();
			db.dbConnect("jdbc:sqlserver://localhost:1433;databaseName=Test;selectMethod=cursor", "TestUser", "swssws", 6, aa, bb, cc, dd, ee, ff);	
		}
		
	}
	
	public static void main(String args[]){
		www.Win();
		
		
	}

	

}

