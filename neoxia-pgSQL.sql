PGDMP     0                    {        
   restaurant    15.4    15.4 8    >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            A           1262    16429 
   restaurant    DATABASE     }   CREATE DATABASE restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE restaurant;
                postgres    false            c           1247    16577    user_roles_enum    TYPE     R   CREATE TYPE public.user_roles_enum AS ENUM (
    'ROLE_ADMIN',
    'ROLE_USER'
);
 "   DROP TYPE public.user_roles_enum;
       public          postgres    false            �            1259    16518 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    16517    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    219            B           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    218            �            1259    16564    order    TABLE     �   CREATE TABLE public."order" (
    id integer NOT NULL,
    "orderAt" timestamp without time zone DEFAULT now() NOT NULL,
    "shippingAddressId" integer,
    "userId" integer
);
    DROP TABLE public."order";
       public         heap    postgres    false            �            1259    16563    order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public          postgres    false    226            C           0    0    order_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;
          public          postgres    false    225            �            1259    16556    orders_products    TABLE     �   CREATE TABLE public.orders_products (
    id integer NOT NULL,
    product_unit_price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    product_quantity integer NOT NULL,
    "orderId" integer,
    "productId" integer
);
 #   DROP TABLE public.orders_products;
       public         heap    postgres    false            �            1259    16555    orders_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.orders_products_id_seq;
       public          postgres    false    224            D           0    0    orders_products_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.orders_products_id_seq OWNED BY public.orders_products.id;
          public          postgres    false    223            �            1259    16480    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    title character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16479    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    215            E           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    214            �            1259    16546 	   shippings    TABLE     C  CREATE TABLE public.shippings (
    id integer NOT NULL,
    phone character varying NOT NULL,
    name character varying DEFAULT ' '::character varying NOT NULL,
    address character varying NOT NULL,
    city character varying NOT NULL,
    "postCode" character varying NOT NULL,
    state character varying NOT NULL
);
    DROP TABLE public.shippings;
       public         heap    postgres    false            �            1259    16545    shippings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shippings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.shippings_id_seq;
       public          postgres    false    222            F           0    0    shippings_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.shippings_id_seq OWNED BY public.shippings.id;
          public          postgres    false    221            �            1259    16506    user    TABLE     	  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    roles public.user_roles_enum[] DEFAULT '{ROLE_USER}'::public.user_roles_enum[] NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false    867    867            �            1259    16505    user_entity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_entity_id_seq;
       public          postgres    false    217            G           0    0    user_entity_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.user_entity_id_seq OWNED BY public."user".id;
          public          postgres    false    216            �            1259    16526    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    217            H           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    220            �           2604    16521    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16567    order id    DEFAULT     f   ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16559    orders_products id    DEFAULT     x   ALTER TABLE ONLY public.orders_products ALTER COLUMN id SET DEFAULT nextval('public.orders_products_id_seq'::regclass);
 A   ALTER TABLE public.orders_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16483 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16549    shippings id    DEFAULT     l   ALTER TABLE ONLY public.shippings ALTER COLUMN id SET DEFAULT nextval('public.shippings_id_seq'::regclass);
 ;   ALTER TABLE public.shippings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16544    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    217            4          0    16518 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          postgres    false    219   (@       ;          0    16564    order 
   TABLE DATA           O   COPY public."order" (id, "orderAt", "shippingAddressId", "userId") FROM stdin;
    public          postgres    false    226   h@       9          0    16556    orders_products 
   TABLE DATA           k   COPY public.orders_products (id, product_unit_price, product_quantity, "orderId", "productId") FROM stdin;
    public          postgres    false    224   �@       0          0    16480    product 
   TABLE DATA           3   COPY public.product (id, title, price) FROM stdin;
    public          postgres    false    215   �@       7          0    16546 	   shippings 
   TABLE DATA           V   COPY public.shippings (id, phone, name, address, city, "postCode", state) FROM stdin;
    public          postgres    false    222   A       2          0    16506    user 
   TABLE DATA           B   COPY public."user" (id, name, email, password, roles) FROM stdin;
    public          postgres    false    217   KA       I           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);
          public          postgres    false    218            J           0    0    order_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.order_id_seq', 1, true);
          public          postgres    false    225            K           0    0    orders_products_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.orders_products_id_seq', 1, true);
          public          postgres    false    223            L           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 5, true);
          public          postgres    false    214            M           0    0    shippings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.shippings_id_seq', 1, true);
          public          postgres    false    221            N           0    0    user_entity_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_entity_id_seq', 4, true);
          public          postgres    false    216            O           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 5, true);
          public          postgres    false    220            �           2606    16573 $   order PK_1031171c13130102495201e3e20 
   CONSTRAINT     f   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."order" DROP CONSTRAINT "PK_1031171c13130102495201e3e20";
       public            postgres    false    226            �           2606    16562 .   orders_products PK_4945c6758fd65ffacda760b4ac9 
   CONSTRAINT     n   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT "PK_4945c6758fd65ffacda760b4ac9" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT "PK_4945c6758fd65ffacda760b4ac9";
       public            postgres    false    224            �           2606    16554 (   shippings PK_665fb613135782a598a2b47e5b2 
   CONSTRAINT     h   ALTER TABLE ONLY public.shippings
    ADD CONSTRAINT "PK_665fb613135782a598a2b47e5b2" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.shippings DROP CONSTRAINT "PK_665fb613135782a598a2b47e5b2";
       public            postgres    false    222            �           2606    16525 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            postgres    false    219            �           2606    16514 #   user PK_b54f8ea623b17094db7667d8206 
   CONSTRAINT     e   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_b54f8ea623b17094db7667d8206" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_b54f8ea623b17094db7667d8206";
       public            postgres    false    217            �           2606    16487 &   product PK_bebc9158e480b949565b4dc7a82 
   CONSTRAINT     f   ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.product DROP CONSTRAINT "PK_bebc9158e480b949565b4dc7a82";
       public            postgres    false    215            �           2606    16575 $   order REL_a9e568150eecef07380e7f5fc7 
   CONSTRAINT     r   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_a9e568150eecef07380e7f5fc7" UNIQUE ("shippingAddressId");
 R   ALTER TABLE ONLY public."order" DROP CONSTRAINT "REL_a9e568150eecef07380e7f5fc7";
       public            postgres    false    226            �           2606    16516 #   user UQ_415c35b9b3b6fe45a3b065030f5 
   CONSTRAINT     c   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_415c35b9b3b6fe45a3b065030f5" UNIQUE (email);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "UQ_415c35b9b3b6fe45a3b065030f5";
       public            postgres    false    217            �           2606    16594 .   orders_products FK_4eff63e89274f79195e25c5c115    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT "FK_4eff63e89274f79195e25c5c115" FOREIGN KEY ("productId") REFERENCES public.product(id);
 Z   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT "FK_4eff63e89274f79195e25c5c115";
       public          postgres    false    215    224    3214            �           2606    16589 .   orders_products FK_823bad3524a5d095453c43286bb    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT "FK_823bad3524a5d095453c43286bb" FOREIGN KEY ("orderId") REFERENCES public."order"(id);
 Z   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT "FK_823bad3524a5d095453c43286bb";
       public          postgres    false    224    226    3226            �           2606    16599 $   order FK_a9e568150eecef07380e7f5fc7c    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_a9e568150eecef07380e7f5fc7c" FOREIGN KEY ("shippingAddressId") REFERENCES public.shippings(id);
 R   ALTER TABLE ONLY public."order" DROP CONSTRAINT "FK_a9e568150eecef07380e7f5fc7c";
       public          postgres    false    222    3222    226            �           2606    16604 $   order FK_caabe91507b3379c7ba73637b84    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_caabe91507b3379c7ba73637b84" FOREIGN KEY ("userId") REFERENCES public."user"(id);
 R   ALTER TABLE ONLY public."order" DROP CONSTRAINT "FK_caabe91507b3379c7ba73637b84";
       public          postgres    false    3216    217    226            4   0   x�3�44�4545160036�t��KI�	-N-�/JI-B������ L�m      ;   .   x�3�4202�5��5�T02�25�21�324�42�4�4����� ���      9      x�3�45�30�4�4�4����� ��      0   3   x�3�v�s	�t�P�vurt�45�30�2����<c�	v-�(�b���� �`u      7   '   x�3�403205A�⒢̼t4����� ������ |�x      2   E  x�e��n�` �3<�g*;܊,�o��5MD�M6�4�{�B�������G��Ϥ
�	�
Za��^]���3��yKt��U*�����"�	�a 5.���]�ġ2Z�߻%��\K< �N�s	0�z�YM�2�n�<�B�h#v���I-©��D@o�r�;u��&��N0��P?tY��O�\�9��L�#u�o�@GkD����/�ڛ#�>�M��W�O`3�Z�d;� +9�ɛi��B9��6XG>*#;��ָ��@u9�x�g�k]�kIH�8�"c>��$��� ���rEW���1}0��$����kb���Έo��܎��     