//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SysArcos
{
    using System;
    using System.Collections.Generic;
    
    public partial class ASSISTENCIA
    {
        public int ID { get; set; }
        public System.DateTime DATA_INICIAL { get; set; }
        public System.DateTime DATA_FINAL { get; set; }
        public string OBSERVACOES { get; set; }
        public System.DateTime DATA_HORA_CRIACAO_REGISTRO { get; set; }
    
        public virtual ASSISTIDO ASSISTIDO { get; set; }
        public virtual ENTIDADE ENTIDADE { get; set; }
        public virtual TIPO_ASSISTENCIA TIPO_ASSISTENCIA { get; set; }
    }
}
