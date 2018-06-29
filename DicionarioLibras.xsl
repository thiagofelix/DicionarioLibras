<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="xml" />

 <xsl:template match="/">
   <d:dictionary xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
     <xsl:apply-templates select="//entry" />
   </d:dictionary>
 </xsl:template>

 <xsl:template match="entry">
   <d:entry xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
     id="{id}"
     d:title="{palavra}">
     <d:index d:value="{palavra}" d:title="{palavra}" d:anchor="xpointer(//*[@id='{palavra}'])"/>

     <h1 id="firstHeading" class="firstHeading"><xsl:value-of select="palavra"/></h1>
     <div id="firstindeindex"></div>
     <p><xsl:value-of select="acepcao"/></p>
     <dl>
       <dt>Assunto</dt>
       <dd><xsl:value-of select="assunto_title"/></dd>
       <dt>Classe</dt>
       <dd><xsl:value-of select="classe"/></dd>
       <dt>Exemplo</dt>
       <dd><xsl:value-of select="exemplo"/></dd>
       <dt>Exemplo Libras</dt>
       <dd><xsl:value-of select="libras"/></dd>
       <dt>Origem</dt>
       <dd><xsl:value-of select="origem"/></dd>
     </dl>
     <ul>
       <li><img src="http://www.acessibilidadebrasil.org.br/libras_3/public/media/mao/{mao}" width="100"/></li>
        <li><img src="http://www.acessibilidadebrasil.org.br/libras_3/public/media/palavras/images/{img}" width="100"/></li>
        <!-- <li><img src="https://media.tenor.com/images/ac287fd06319e47b1533737662d5bfe8/tenor.gif" width="100"/></li> -->
        <!-- <li> -->
        <!--   <video autoplay="true" loop="true" muted="true" controls="true"> -->
        <!--     <source src="https://www.acessibilidadebrasil.org.br/libras_3/public/media/palavras/videos/abacaxiSm_Prog001.mp4"></source> -->
        <!--   </video> -->
        <!-- </li> -->
     </ul>
   </d:entry>
 </xsl:template>
 </xsl:stylesheet>
