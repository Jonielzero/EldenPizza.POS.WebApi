using Microsoft.EntityFrameworkCore;
using POS.Data.Entities;
using POS.Data.Maps;

namespace EldenPizza.POS.WebApi.Infrastructure
{
    public class EldenPizzaContext : DbContext
    {

        public DbSet<TipoProducto> TiposProducto => Set<TipoProducto>();
        public DbSet<Producto> Productos => Set<Producto>();

        public EldenPizzaContext(DbContextOptions<EldenPizzaContext> options) : base(options)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new TipoProductoMap());
            modelBuilder.ApplyConfiguration(new ProductoMap());
        }
    }
 }
